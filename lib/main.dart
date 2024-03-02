import 'package:daln/view/home/homepage.dart';
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
      title: "Food App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5f5f3),
      ),
      routes: {
        "/": (context) => HomePage(),
      },
    );
  }
}
