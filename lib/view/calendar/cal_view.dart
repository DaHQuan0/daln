import 'package:daln/view/account/acc_view.dart';
import 'package:daln/view/home/homepage.dart';
import 'package:daln/view/report/report_view.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _AccViewState();
}

class _AccViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cal View"),
      ),
      body: SingleChildScrollView(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.pie_chart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportView()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarView()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_balance),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
