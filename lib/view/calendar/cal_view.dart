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
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.pie_chart),
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút home
              },
            ),
            IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút search
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút settings
              },
            ),
            IconButton(
              icon: Icon(Icons.account_balance),
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút settings
              },
            ),
          ],
        ),
      ),
    );
  }
}
