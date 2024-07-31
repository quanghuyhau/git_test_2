import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/dio_retrofit/screen/coin_screen.dart';
import 'package:learn_flutter/setting/ui/custom_scrollview.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoinListScreen(),
    );
  }
}