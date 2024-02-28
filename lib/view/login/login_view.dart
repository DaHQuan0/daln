import 'package:daln/common_widget/LineTextField.dart';
import 'package:daln/view/home/homepage.dart';
import 'package:daln/widget/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Color(0xFF156081),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 200,
          left: 40,
          right: 30,
        ),
        child: Column(
          children: [
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const TextField(
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            const TextField(
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 40.0),
                width: 300,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFC0E4F4),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Color(0xFF156081),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {},
                  child: const Text("SIGN UP"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
