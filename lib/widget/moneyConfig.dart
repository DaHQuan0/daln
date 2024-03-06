import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final InMoneyService firestoreService = InMoneyService();

//   final TextEditingController textController = TextEditingController();
//   double inputAmount = 0.0;

//   void openMoneyBox({String? docID}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: TextField(
//           controller: textController,
//           onChanged: (newText) {
//             setState(() {
//               inputAmount = double.tryParse(newText) ?? 0.0;
//             });
//           },
//           keyboardType: TextInputType.numberWithOptions(decimal: true),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               if (docID == null) {
//                 firestoreService.addMoney(inputAmount);
//               } else {
//                 firestoreService.updateMoney(docID, inputAmount);
//               }
//               textController.clear();
//               setState(() {
//                 inputAmount = 0.0;
//               });
//               Navigator.pop(context);
//             },
//             child: Text('Add'),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Demo'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => openMoneyBox(),
//         child: Icon(Icons.add),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: firestoreService.getMoneysStream(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<QueryDocumentSnapshot> moneyList = snapshot.data!.docs;

//             return ListView.builder(
//               itemCount: moneyList.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot document = moneyList[index];
//                 String docID = document.id;

//                 Map<String, dynamic> data =
//                     document.data() as Map<String, dynamic>;
//                 double inmoney = data['inmoney'] as double;

//                 return ListTile(
//                   title: Text(inmoney.toString()),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         onPressed: () => openMoneyBox(docID: docID),
//                         icon: Icon(Icons.settings),
//                       ),
//                       IconButton(
//                         onPressed: () => firestoreService.deleteMoney(docID),
//                         icon: Icon(Icons.delete),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Text('No data...');
//           }
//         },
//       ),
//     );
//   }
// }

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
