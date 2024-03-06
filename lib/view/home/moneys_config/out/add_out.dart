import 'package:daln/common_widget/feature_card.dart';
import 'package:daln/widget/moneyConfig.dart';
import 'package:flutter/material.dart';

class AddMOutView extends StatefulWidget {
  const AddMOutView({super.key});

  @override
  State<AddMOutView> createState() => _AddMOutViewState();
}

class _AddMOutViewState extends State<AddMOutView> {
  final OutMoneyService outMoneyService = OutMoneyService();

  final TextEditingController textController = TextEditingController();
  String inputText = '';

  void openMoneyBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          onChanged: (newText) {
            setState(() {
              inputText = newText;
            });
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                outMoneyService.addMoney(inputText);
              } else {
                outMoneyService.updateMoney(docID, inputText);
              }
              textController.clear();
              setState(() {
                inputText = '';
              });
              Navigator.pop(context);
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
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () => openMoneyBox(),
                child: FeatureCard(
                  title: 'Ăn uống',
                  image: Image.asset('assets/img/anuong.png'),
                ),
              ),
              GestureDetector(
                onTap: () => openMoneyBox(),
                child: FeatureCard(
                  title: 'Mua sắm',
                  image: Image.asset('assets/img/shopping.png'),
                ),
              ),
              GestureDetector(
                onTap: () => openMoneyBox(),
                child: FeatureCard(
                  title: 'Đi lại',
                  image: Image.asset('assets/img/go.png'),
                ),
              ),
              GestureDetector(
                onTap: () => openMoneyBox(),
                child: FeatureCard(
                  title: 'Nhà cửa',
                  image: Image.asset('assets/img/house.png'),
                ),
              ),
              GestureDetector(
                onTap: () => openMoneyBox(),
                child: FeatureCard(
                  title: 'Học tập',
                  image: Image.asset('assets/img/learn.png'),
                ),
              ),
              GestureDetector(
                onTap: () => openMoneyBox(),
                child: FeatureCard(
                  title: 'Cho vay',
                  image: Image.asset('assets/img/vay.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
