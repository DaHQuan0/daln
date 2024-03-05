import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final String id;
  final String type;
  final double amount;
  final Timestamp timestamp;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.timestamp,
  });
}

class ConfigMoney {
  CollectionReference transactions =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> addTransaction(String type, double amount) async {
    try {
      Timestamp timestamp = Timestamp.now();
      await transactions.add({
        'type': type,
        'amount': amount,
        'timestamp': timestamp,
      });
    } catch (e) {
      print('Error adding transaction: $e');
    }
  }

  Future<void> updateTransaction(String id, String type, double amount) async {
    try {
      Timestamp timestamp = Timestamp.now();
      await transactions.doc(id).update({
        'type': type,
        'amount': amount,
        'timestamp': timestamp,
      });
    } catch (e) {
      print('Error updating transaction: $e');
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await transactions.doc(id).delete();
    } catch (e) {
      print('Error deleting transaction: $e');
    }
  }
}
