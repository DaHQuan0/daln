import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController textController = TextEditingController();
  String inputText = '';

  void openMoneyBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          onChanged: (newText) {
            setState(() {
              inputText = newText;
            });
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                firestoreService.addMoney(inputText);
              } else {
                firestoreService.updateMoney(docID, inputText);
              }
              textController.clear();
              setState(() {
                inputText = '';
              });
              Navigator.pop(context);
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openMoneyBox(),
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getMoneysStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot> moneyList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: moneyList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = moneyList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                return ListTile(
                  title: Text(data['money']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => openMoneyBox(docID: docID),
                        icon: Icon(Icons.settings),
                      ),
                      IconButton(
                        onPressed: () => firestoreService.deleteMoney(docID),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Text('No data...');
          }
        },
      ),
    );
  }
}

class FirestoreService {
  final CollectionReference moneys =
      FirebaseFirestore.instance.collection('moneys');

  Future<void> addMoney(String money) {
    return moneys.add({
      'money': money,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getMoneysStream() {
    final moneyStream =
        moneys.orderBy('timestamp', descending: true).snapshots();

    return moneyStream;
  }

  Future<void> updateMoney(String docID, String newM) {
    return moneys.doc(docID).update({
      'money': newM,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteMoney(String docId) {
    return moneys.doc(docId).delete();
  }
}
