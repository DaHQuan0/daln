import 'package:flutter/material.dart';

class WellcomeView extends StatefulWidget {
  const WellcomeView({super.key});

  @override
  State<WellcomeView> createState() => _WellcomeViewState();
}

class _WellcomeViewState extends State<WellcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).popAndPushNamed("/singin"),
              child: Text(
                "Đăng ký",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).popAndPushNamed("/login"),
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
