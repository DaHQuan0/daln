class ReportModel {
  int? reportId;
  String? name;
  DateTime? dateTime;
  double? money;

  ReportModel({this.reportId, this.name, this.dateTime, this.money});

  ReportModel.fromJson(Map<String, dynamic> json) {
    reportId = json['id'];
    name = json['name'];
    dateTime = DateTime.parse(json['datetime']);
    money = json['money'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = reportId;
    data['name'] = name;
    data['datetime'] = dateTime!.toIso8601String();
    data['money'] = money;
    return data;
  }
}
