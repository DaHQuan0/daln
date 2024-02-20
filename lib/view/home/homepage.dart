import 'package:daln/view/account/acc_view.dart';
import 'package:daln/view/calendar/cal_view.dart';
import 'package:daln/view/report/report_view.dart';
import '../../common_widget/feature_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theo ngày',
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // TODO: Xử lý sự kiện mở lịch chọn ngày
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // TODO: Xử lý sự kiện nhấn nút Khoản chi tiêu
                },
                child: const Text('Khoản chi tiêu'),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Xử lý sự kiện nhấn nút Khoản thu về
                },
                child: const Text('Khoản thu về'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 500,
          ),
          // Tính năng chính
          Expanded(
            child: Container(
              color: Colors.lightGreen, // Màu nền của phần tính năng chính
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage()), // Đường dẫn đến _HomeViewState
                        );
                      },
                      child: FeatureCard(
                        icon: Icons.pie_chart,
                        title: 'Tổng hợp',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ReportView()), // Đường dẫn đến _HomeViewState
                        );
                      },
                      child: FeatureCard(
                        icon: Icons.bar_chart,
                        title: 'Báo cáo',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CalendarView()), // Đường dẫn đến _HomeViewState
                        );
                      },
                      child: FeatureCard(
                        icon: Icons.calendar_today,
                        title: 'Lịch',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AccView()), // Đường dẫn đến _HomeViewState
                        );
                      },
                      child: FeatureCard(
                        icon: Icons.account_balance,
                        title: 'Tài khoản',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
