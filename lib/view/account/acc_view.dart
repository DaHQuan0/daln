import 'package:daln/view/home/homepage.dart';
import 'package:daln/view/report/report_view.dart';
import 'package:daln/widget/fb_auth.dart';
import 'package:daln/widget/moneyConfig.dart';
import 'package:flutter/material.dart';

class AccView extends StatefulWidget {
  const AccView({Key? key}) : super(key: key);

  @override
  State<AccView> createState() => _AccViewState();
}

class _AccViewState extends State<AccView> {
  double totalMoney = 0.0;

  @override
  void initState() {
    super.initState();
    displayTotalMoney();
  }

  void displayTotalMoney() async {
    try {
      final money = await getTotalMoney();
      setState(() {
        totalMoney = money;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  String formatMoney(double money) {
    return money.toStringAsFixed(0) + 'đ';
  }

  FirebaseAuthService _auth = FirebaseAuthService();
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
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
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
                          Text(formatMoney(totalMoney)),
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
                  child: const Row(
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
                  child: const Row(
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
                  child: const Row(
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
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.of(context).popAndPushNamed("/login");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Row(
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
              // SizedBox(
              //   height: 130,
              // ),
            ],
          ),
        ),
      ),
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
