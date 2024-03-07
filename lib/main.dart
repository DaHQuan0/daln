import 'package:daln/view/home/moneys_config/in/add_in.dart';
import 'package:daln/view/home/moneys_config/out/add_out.dart';
import 'package:daln/view/home/homepage.dart';
import 'package:daln/view/login/login_view.dart';
import 'package:daln/view/login/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Step 0: create a project on https://console.firebase.google.com and performs setting following the guidelines
  // Step 1: flutter pud add firebase_core and firebase_auth
  // Step 2 add below two lines:
  // Step 3: go to sigup_screen.dart
  WidgetsFlutterBinding
      .ensureInitialized(); // make sure firebase is initialized before we run our application
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // to can use firebase Product and this is a asynchronous function
  // run again to make sure out settings working properly or not, if there is no error it means
  // firebase initialization was proper
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5f5f3),
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/singin": (context) => SigninView(),
        "/login": (context) => LoginView(),
        "/add-out": (context) => AddMOutView(),
        "/add-in": (context) => AddMInView()
      },
    );
  }
}
