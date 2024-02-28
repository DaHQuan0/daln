import 'package:daln/common_widget/feature_card.dart';
import 'package:daln/view/home/homepage.dart';
import 'package:flutter/material.dart';

class AddMView extends StatefulWidget {
  const AddMView({super.key});

  @override
  State<AddMView> createState() => _AddMViewState();
}

class _AddMViewState extends State<AddMView> {
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
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
