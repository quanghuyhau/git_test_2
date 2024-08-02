// import 'package:flutter/material.dart';
// import 'package:learn_flutter/ui/learn/login/login_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//             style: TextButton.styleFrom(
//               backgroundColor: Color(0xFFF1F4FF),),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//             },
//             child: Icon(Icons.arrow_back)),
//         title: Align(
//           alignment: Alignment.center,
//             child: Text("Explore",style: TextStyle(fontSize: 28),)),
//         actions: [
//           IconButton(onPressed: (){},
//               icon:Icon(Icons.shopping_bag_outlined))
//         ],
//
//       ),
//       body: Container(
//         child: Center(child: Text("Màn Hình Chính")),
//       ),
//     );
//   }
// }
