import 'package:daln/common_widget/feature_card.dart';
import 'package:daln/view/home/home.dart';
import 'package:flutter/material.dart';

class AddMInView extends StatefulWidget {
  const AddMInView({super.key});

  @override
  State<AddMInView> createState() => _AddMInViewState();
}

class _AddMInViewState extends State<AddMInView> {
  final FirestoreService firestoreService = FirestoreService();

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
                firestoreService.addMoney(inputText);
              } else {
                firestoreService.updateMoney(docID, inputText);
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
                child: FeatureCard(icon: Icons.food_bank),
              ),
              FeatureCard(icon: (Icons.food_bank)),
              FeatureCard(icon: (Icons.food_bank)),
              FeatureCard(icon: (Icons.food_bank)),
              FeatureCard(icon: (Icons.food_bank)),
              FeatureCard(icon: (Icons.food_bank)),
            ],
          ),
        ),
      ),
    );
  }
}
