import 'package:daln/view/account/acc_view.dart';
import 'package:daln/view/home/homepage.dart';
import 'package:daln/widget/moneyConfig.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  late Future<double> totalInMoneyFuture;
  late Future<double> totalOutMoneyFuture;
  late double totalInMoney;
  late double totalOutMoney;

  @override
  void initState() {
    super.initState();
    totalInMoneyFuture = getTotalInMoney();
    totalOutMoneyFuture = getTotalOutMoney();
  }

  final TextEditingController textController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String selectedOption = 'ngày';

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

  List<PieChartSectionData> _createChartData() {
    final data = [
      PieChartSectionData(
        value: totalInMoney,
        color: Colors.blue,
        title: 'Thu',
        radius: 80,
      ),
      PieChartSectionData(
        value: totalOutMoney,
        color: Colors.red,
        title: 'Chi',
        radius: 80,
      ),
    ];

    return data;
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
      ),
      body: FutureBuilder<double>(
        future: totalOutMoneyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            totalOutMoney = snapshot.data!;
            return FutureBuilder<double>(
              future: totalInMoneyFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  totalInMoney = snapshot.data!;
                  return Center(
                    child: Container(
                      height: 300.0,
                      child: PieChart(
                        PieChartData(
                          sections: _createChartData(),
                          sectionsSpace: 0,
                          centerSpaceRadius: 60,
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.pie_chart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportView()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_balance),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
