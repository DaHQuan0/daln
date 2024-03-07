import 'package:cloud_firestore/cloud_firestore.dart';

class InMoneyService {
  final CollectionReference inmoneys =
      FirebaseFirestore.instance.collection('inmoneys');

  Future<void> addMoney(double inmoney) {
    return inmoneys.add({
      'inmoney': inmoney,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getMoneysStream() {
    final moneyStream =
        inmoneys.orderBy('timestamp', descending: true).snapshots();

    return moneyStream;
  }

  Future<void> updateMoney(String docID, double newM) {
    return inmoneys.doc(docID).update({
      'inmoney': newM,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteMoney(String docId) {
    return inmoneys.doc(docId).delete();
  }

  Future<double> getTotalInMoney() async {
    final snapshot = await inmoneys.get();
    double totalInMoney = 0;

    for (var doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        final inmoney = data['inmoney'] as double?;
        if (inmoney != null) {
          totalInMoney += inmoney;
        }
      }
    }

    return totalInMoney;
  }
}

class OutMoneyService {
  final CollectionReference outmoneys =
      FirebaseFirestore.instance.collection('outmoneys');

  Future<void> addMoney(double outmoney) {
    return outmoneys.add({
      'outmoney': outmoney,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getMoneysStream() {
    final moneyStream =
        outmoneys.orderBy('timestamp', descending: true).snapshots();

    return moneyStream;
  }

  Future<void> updateMoney(String docID, double newM) {
    return outmoneys.doc(docID).update({
      'outmoney': newM,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteMoney(String docId) {
    return outmoneys.doc(docId).delete();
  }

  Future<double> getTotalOutMoney() async {
    final snapshot = await outmoneys.get();
    double totalOutMoney = 0;

    for (var doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        final outmoney = data['outmoney'] as double?;
        if (outmoney != null) {
          totalOutMoney += outmoney;
        }
      }
    }

    return totalOutMoney;
  }
}

final inMoneyService = InMoneyService();
final outMoneyService = OutMoneyService();
Future<double> getTotalMoney() async {
  final totalInMoney = await inMoneyService.getTotalInMoney();
  final totalOutMoney = await outMoneyService.getTotalOutMoney();

  final totalMoney = totalInMoney - totalOutMoney;
  return totalMoney;
}

Future<double> getTotalInMoney() async {
  // Lấy tổng số tiền thu vào trong ngày
  final totalInMoney = await inMoneyService.getTotalInMoney();
  return totalInMoney;
}

Future<double> getTotalOutMoney() async {
  // Lấy tổng số tiền tiêu ra trong ngày
  final totalOutMoney = await outMoneyService.getTotalOutMoney();
  return totalOutMoney;
}
