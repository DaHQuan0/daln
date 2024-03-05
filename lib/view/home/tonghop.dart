// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:daln/view/account/acc_view.dart';
// import 'package:daln/view/home/out/add_out.dart';
// import 'package:daln/view/home/home.dart';
// import 'package:daln/view/home/in/in.dart';
// import 'package:daln/view/home/out/out.dart';
// import 'package:daln/view/report/report_view.dart';
// import 'package:flutter/material.dart';

// class TongHop extends StatefulWidget {
//   const TongHop({Key? key});

//   @override
//   State<TongHop> createState() => _TongHopState();
// }

// class _TongHopState extends State<TongHop> {
//   late DateTime _selectedDateTime;
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
//   void initState() {
//     super.initState();
//     _selectedDateTime = DateTime.now();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Theo ngày',
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.lightBlueAccent,
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.calendar_today),
//             onPressed: () {
//               showDatePicker(
//                 initialEntryMode: DatePickerEntryMode.input,
//                 context: context,
//                 initialDate: _selectedDateTime,
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(3000),
//               ).then((selectedDate) {
//                 if (selectedDate != null) {
//                   setState(() {
//                     _selectedDateTime = selectedDate;
//                   });
//                 }
//               });
//             },
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(50.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const OutMView()),
//                   );
//                 },
//                 child: const Text('Khoản chi tiêu'),
//               ),
//               const SizedBox(width: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const InMView()),
//                   );
//                 },
//                 child: const Text('Khoản thu về'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
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
//                   title: Text(data['money']),
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
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddMView()),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.lightBlueAccent,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.pie_chart),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const TongHop()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.bar_chart),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ReportView()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.account_balance),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const AccView()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
