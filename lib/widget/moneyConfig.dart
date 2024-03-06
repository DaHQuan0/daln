import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final FirestoreService firestoreService = FirestoreService();

//   final TextEditingController textController = TextEditingController();
//   String inputText = '';

//   void openMoneyBox({String? docID}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: TextField(
//           controller: textController,
//           onChanged: (newText) {
//             setState(() {
//               inputText = newText;
//             });
//           },
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               if (docID == null) {
//                 firestoreService.addMoney(inputText);
//               } else {
//                 firestoreService.updateMoney(docID, inputText);
//               }
//               textController.clear();
//               setState(() {
//                 inputText = '';
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

//                 return ListTile(
//                   title: Text(data['inmoney']),
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

  Future<void> addMoney(String inmoney) {
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

  Future<void> updateMoney(String docID, String newM) {
    return inmoneys.doc(docID).update({
      'inmoney': newM,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteMoney(String docId) {
    return inmoneys.doc(docId).delete();
  }
}

class OutMoneyService {
  final CollectionReference outmoneys =
      FirebaseFirestore.instance.collection('outmoneys');

  Future<void> addMoney(String outmoney) {
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

  Future<void> updateMoney(String docID, String newM) {
    return outmoneys.doc(docID).update({
      'outmoney': newM,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteMoney(String docId) {
    return outmoneys.doc(docId).delete();
  }
}
