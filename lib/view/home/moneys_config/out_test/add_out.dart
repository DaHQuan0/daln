// import 'package:daln/common_widget/feature_card.dart';
// import 'package:daln/view/home/moneys_config/out/out.dart';
// import 'package:daln/widget/moneyConfig.dart';
// import 'package:flutter/material.dart';

// class AddMOutView extends StatefulWidget {
//   const AddMOutView({super.key});

//   @override
//   State<AddMOutView> createState() => _AddMOutViewState();
// }

// class _AddMOutViewState extends State<AddMOutView> {
//   final OutMoneyService outMoneyService = OutMoneyService();

//   final TextEditingController textController = TextEditingController();
//   double outputAmount = 0.0;

//   void openMoneyBox({String? docID, String? title}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: TextField(
//           controller: textController,
//           onChanged: (newText) {
//             setState(() {
//               outputAmount = double.tryParse(newText) ?? 0.0;
//             });
//           },
//           keyboardType: TextInputType.numberWithOptions(decimal: true),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               if (docID == null) {
//                 outMoneyService.addMoney(outputAmount, title: title);
//               } else {
//                 outMoneyService.updateMoney(docID, outputAmount, title: title);
//               }
//               textController.clear();
//               setState(() {
//                 outputAmount = 0.0;
//               });
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => OutMView(),
//                 ),
//               );
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
//         title: const Text('Thêm giao dịch'),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 245, 159, 188),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Wrap(
//             alignment: WrapAlignment.spaceBetween,
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () => openMoneyBox(title: "Ăn uống"),
//                 child: FeatureCard(
//                   title: 'Ăn uống',
//                   image: Image.asset('assets/img/anuong.png'),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => openMoneyBox(title: 'Mua sắm'),
//                 child: FeatureCard(
//                   title: 'Mua sắm',
//                   image: Image.asset('assets/img/shopping.png'),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => openMoneyBox(title: 'Đi lại'),
//                 child: FeatureCard(
//                   title: 'Đi lại',
//                   image: Image.asset('assets/img/go.png'),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => openMoneyBox(title: 'Nhà cửa'),
//                 child: FeatureCard(
//                   title: 'Nhà cửa',
//                   image: Image.asset('assets/img/house.png'),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => openMoneyBox(title: 'Học tập'),
//                 child: FeatureCard(
//                   title: 'Học tập',
//                   image: Image.asset('assets/img/learn.png'),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => openMoneyBox(title: 'Cho vay'),
//                 child: FeatureCard(
//                   title: 'Cho vay',
//                   image: Image.asset('assets/img/vay.png'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
