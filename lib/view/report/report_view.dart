import 'package:flutter/material.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theo ngày"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(),
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
