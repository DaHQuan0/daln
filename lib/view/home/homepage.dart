import 'package:daln/common_widget/report_card.dart';
import 'package:daln/view/account/acc_view.dart';
import 'package:daln/view/calendar/cal_view.dart';
import 'package:daln/view/report/report_detail_view.dart';
import 'package:daln/view/report/report_view.dart';
import 'package:daln/widget/home_view_model.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomePage> {
  TextEditingController txtSearch = TextEditingController();

  final homeVM = Get.put(HomeViewModel());

  @override
  void dispose() {
    Get.delete<HomeViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theo ngày',
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
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
      body: const SingleChildScrollView(
          // children: [
          //    SizedBox(
          //      height: 536,
          //      child: Obx(() => ListView.builder(
          //          scrollDirection: Axis.horizontal,
          //          padding: const EdgeInsets.symmetric(horizontal: 15),
          //          itemCount: homeVM.reportList.length,
          //          itemBuilder: (context, index) {
          //            var pObj = homeVM.reportList[index];
          //            return ReportCard(
          //              pObj: pObj,
          //              onTap: () async {
          //                await Get.to(() => ReportDetails(pObj: pObj));
          //                //homeVM.serviceCallHome();
          //              },
          //            );
          //          })),
          //    ),
          // ],
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
