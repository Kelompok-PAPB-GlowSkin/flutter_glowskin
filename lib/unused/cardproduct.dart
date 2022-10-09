// import 'package:flutter/material.dart';
// import 'package:glowskin_project/model/product.dart';
// import 'package:glowskin_project/users/detailpage.dart';

// class CardProduct extends StatelessWidget {
//   final String name;
//   final String image;

//   CardProduct({required this.name, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 208,
//       height: 349,
//       margin: const EdgeInsets.only(right: 20),
//       decoration: BoxDecoration(
//           color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(20)),
//       child: Column(children: [
//         Container(
//           height: 240,
//           margin:
//               const EdgeInsets.only(left: 10, right: 15, top: 33, bottom: 18),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               RotatedBox(
//                 quarterTurns: -45,
//                 child: Text(
//                   name,
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Expanded(
//                 child: Image.network(
//                   image,
//                   fit: BoxFit.cover,
//                   alignment: new Alignment(-4.0, -1.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Row(
//           children: [
//             Container(
//               width: 129,
//               height: 51,
//               margin: const EdgeInsets.only(left: 10),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return DetailPage(productList[index]);
//                 }));
//                 },
//                 child: Text(
//                   'Detail',
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25))),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 6, right: 10),
//               height: 53,
//               child: SizedBox.fromSize(
//                 size: Size(53, 53),
//                 child: ClipOval(
//                     child: Material(
//                   color: Colors.black,
//                   child: InkWell(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.favorite,
//                       color: Colors.white,
//                     ),
//                   ),
//                 )),
//               ),
//             ),
//           ],
//         ),
//       ]),
//     );
//   }
// }
