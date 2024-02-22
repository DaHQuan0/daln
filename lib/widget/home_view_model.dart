import 'package:daln/model/report_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final RxList<ReportModel> reportList = <ReportModel>[].obs;
}
