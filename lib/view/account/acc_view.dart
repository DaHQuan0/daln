import 'package:daln/common_widget/feature_card.dart';
import 'package:daln/view/calendar/cal_view.dart';
import 'package:daln/view/home/homepage.dart';
import 'package:daln/view/report/report_view.dart';
import 'package:flutter/material.dart';

class AccView extends StatefulWidget {
  const AccView({Key? key}) : super(key: key);

  @override
  State<AccView> createState() => _AccViewState();
}

class _AccViewState extends State<AccView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        color: const Color.fromARGB(255, 150, 215, 245),
        child: SafeArea(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Căn giữa theo chiều dọc
            children: [
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/img/u1.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              const Text(
                "Đào Quân",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "daoanhquan@gmail.com",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 32), // Khoảng cách giữa các thành phần
              // Tổng số dư
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    16, 8, 16, 8), // Giãn cách trái, phải, trên, dưới
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tổng số dư"),
                          Text("0đ"),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                    16, 8, 16, 8), // Giãn cách trái, phải, trên, dưới
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.account_box),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Thông tin cá nhân"),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                    16, 8, 16, 8), // Giãn cách trái, phải, trên, dưới
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.bar_chart),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Thống kê"),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                    16, 8, 16, 8), // Giãn cách trái, phải, trên, dưới
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cài đặt"),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                    16, 8, 16, 8), // Giãn cách trái, phải, trên, dưới
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Đăng xuất"),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    0, 0, 0, 0), // Giãn cách trái, phải, trên, dưới
                child: Expanded(
                  child: Container(
                    color: Colors
                        .lightBlueAccent, // Màu nền của phần tính năng chính
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
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
                                  builder: (context) => ReportView(),
                                ),
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
                                  builder: (context) => CalendarView(),
                                ),
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
                                  builder: (context) => AccView(),
                                ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
