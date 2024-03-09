import 'package:daln/view/home/homepage.dart';
import 'package:daln/view/home/moneys_config/out/out.dart';
import 'package:daln/view/login/login_view.dart';
import 'package:daln/view/login/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5f5f3),
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/singin": (context) => SigninView(),
        "/login": (context) => LoginView(),
        "/add-out": (context) => OutMView(),
      },
    );
  }
}
