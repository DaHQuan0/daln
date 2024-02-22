import 'package:daln/model/report_model.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final ReportModel pObj;
  final VoidCallback onTap;
  const ReportCard({super.key, required this.pObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              color: Colors.red,
            ),
            Container(
              width: 160,
              color: Colors.blue,
            ),
            Container(
              width: 160,
              color: Colors.green,
            ),
            Container(
              width: 160,
              color: Colors.yellow,
            ),
            Container(
              width: 160,
              color: Colors.orange,
            ),
          ],
        ));
  }
}
