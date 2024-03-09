import 'package:daln/common_widget/feature_card.dart';
import 'package:daln/view/home/moneys_config/in/in.dart';
import 'package:daln/widget/moneyConfig.dart';
import 'package:flutter/material.dart';

class AddMInView extends StatefulWidget {
  const AddMInView({super.key});

  @override
  State<AddMInView> createState() => _AddMInViewState();
}

class _AddMInViewState extends State<AddMInView> {
  final InMoneyService inMoneyService = InMoneyService();

  final TextEditingController textController = TextEditingController();
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
          keyboardType: TextInputType.numberWithOptions(decimal: true),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InMView(),
                ),
              );
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm giao dịch'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 245, 159, 188),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            spacing: 60,
            children: <Widget>[
              GestureDetector(
                onTap: () => openMoneyBox(title: 'Tiền lương'),
                child: FeatureCard(
                  title: 'Tiền lương',
                  image: Image.asset('assets/img/luong.png'),
                ),
              ),
              GestureDetector(
                onTap: () => openMoneyBox(title: 'Làm thêm'),
                child: FeatureCard(
                  title: 'Làm thêm',
                  image: Image.asset('assets/img/lamthem.jpg'),
                ),
              ),
              GestureDetector(
                onTap: () => openMoneyBox(title: 'Thu nợ'),
                child: FeatureCard(
                  title: 'Thu nợ',
                  image: Image.asset('assets/img/no.png'),
                ),
              ),
              GestureDetector(
                onTap: () => openMoneyBox(title: 'Học bổng'),
                child: FeatureCard(
                  title: 'Học bổng',
                  image: Image.asset('assets/img/scholarship.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
