import 'package:daln/model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportDetails extends StatefulWidget {
  final ReportModel pObj;
  const ReportDetails({super.key, required this.pObj});

  @override
  State<ReportDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  late ReportModel detailVM;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
