import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daln/view/account/acc_view.dart';
import 'package:daln/view/home/moneys_config/in/add_in.dart';
import 'package:daln/view/home/moneys_config/out/out.dart';
import 'package:daln/widget/moneyConfig.dart';
import 'package:daln/view/home/homepage.dart';
import 'package:daln/view/report/report_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InMView extends StatefulWidget {
  const InMView({super.key});

  @override
  State<InMView> createState() => _InMViewState();
}

class _InMViewState extends State<InMView> {
  final InMoneyService inMoneyService = InMoneyService();

  final TextEditingController textController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String selectedOption = 'ngày';
  double inputAmount = 0.0;

  void openMoneyBox({String? docID, String? title}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          onChanged: (newText) {
            setState(() {
              inputAmount = double.tryParse(newText) ?? 0.0;
            });
          },
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                inMoneyService.addMoney(inputAmount, title: title);
              } else {
                inMoneyService.updateMoney(docID, inputAmount, title: title);
              }
              textController.clear();
              setState(() {
                inputAmount = 0.0;
              });
              Navigator.pop(context);
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void showOptions(BuildContext context) {
    final List<String> options = ['ngày', 'tháng', 'năm'];

    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 0, 0, 0),
      items: options.map((option) {
        return PopupMenuItem(
          value: option,
          child: Text(option),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedOption = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String displayValue = '';

    if (selectedOption == 'ngày') {
      displayValue = DateFormat.yMd().format(selectedDate);
    } else if (selectedOption == 'tháng') {
      displayValue = DateFormat.M().format(selectedDate);
    } else if (selectedOption == 'năm') {
      displayValue = DateFormat.y().format(selectedDate);
    }
    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Theo $selectedOption'),
                Text(
                  displayValue,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            //SizedBox(width: 1),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                showOptions(context);
              },
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OutMView()),
                  );
                },
                child: const Text('Khoản chi tiêu'),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InMView()),
                  );
                },
                child: const Text('Khoản thu về'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: inMoneyService.getMoneysStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot> moneyList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: moneyList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = moneyList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                double inmoney = data['inmoney'] as double;
                String? title = data['title'] as String?;

                // Chuyển đổi Timestamp thành DateTime
                DateTime dateTime = (data['timestamp'] as Timestamp).toDate();

                // Định dạng thời gian và ngày tháng sử dụng DateFormat
                String formattedTime = DateFormat.Hm().format(dateTime);
                String formattedDate = DateFormat.yMd().format(dateTime);

                return Container(
                  color: Colors.grey[200], // Màu nền
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0), // Khoảng cách dọc
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title ?? ''), // Hiển thị title
                        Text(inmoney.toString() + ' VND'),
                      ],
                    ),
                    subtitle: Text(
                        '$formattedTime - $formattedDate'), // Hiển thị thời gian và ngày tháng
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => openMoneyBox(docID: docID),
                          icon: Icon(Icons.settings),
                        ),
                        IconButton(
                          onPressed: () => outMoneyService.deleteMoney(docID),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text('No data...');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMInView()),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.pie_chart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportView()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_balance),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
