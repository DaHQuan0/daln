import 'package:daln/common_widget/mytextfield.dart';
import 'package:daln/view/login/signin_view.dart';
import 'package:daln/widget/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatelessWidget {
  FirebaseAuthService _auth = FirebaseAuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEABB5),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage("assets/img/money.png"),
                    )),
              ),
              SizedBox(height: 15),
              Text(
                'Save Money',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Quản lý chi tiêu cá nhân ',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30),
              MyTextField(
                  controller: emailController,
                  hinText: "Email",
                  obscureText: false),
              SizedBox(height: 20),
              MyTextField(
                  controller: passwordController,
                  hinText: "Password",
                  obscureText: true),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninView()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 140.0, vertical: 15.0)),
                onPressed: () async {
                  User? user = await _auth.loginUserWithEmailAndPassword(
                      emailController.text, passwordController.text);

                  if (user != null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Đã đăng nhập thành công."),
                    ));

                    Navigator.of(context).popAndPushNamed("/add-out");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Có lỗi đăng nhập."),
                    ));
                  }
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void setState(Null Function() param0) {}
}
