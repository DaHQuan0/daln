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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              // Thay đổi từ Column thành Row để đưa phần lịch sang bên trái
              mainAxisAlignment: MainAxisAlignment
                  .end, // Đặt căn chỉnh giữa hai phần tử trong Row
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    // TODO: Xử lý sự kiện mở lịch chọn ngày
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // TODO: Xử lý sự kiện nhấn nút Khoản chi tiêu
                },
                child: Text('Khoản chi tiêu'),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Xử lý sự kiện nhấn nút Khoản thu về
                },
                child: Text('Khoản thu về'),
              ),
            ],
          ),
          const SizedBox(
            height: 150,
          ),
          // Tính năng chính
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  FeatureCard(
                    icon: Icons.pie_chart,
                    title: 'Tổng hợp',
                  ),
                  FeatureCard(
                    icon: Icons.bar_chart,
                    title: 'Báo cáo',
                  ),
                  FeatureCard(
                    icon: Icons.calendar_today,
                    title: 'Lịch',
                  ),
                  FeatureCard(
                    icon: Icons.account_balance,
                    title: 'Tài khoản',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureCard({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(icon, size: 48.0),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
