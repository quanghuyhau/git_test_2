import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/futuredemo/future_builder.dart';
import 'package:learn_flutter/futuredemo/future_group.dart';
import 'package:learn_flutter/futuredemo/imagepicker.dart';
import 'package:learn_flutter/futuredemo/splash_screen.dart';
import 'package:learn_flutter/learn/login/login.dart';
import 'package:learn_flutter/learn/login_bloc/login_screen.dart';
import 'package:learn_flutter/learn/noteapp_bloc/screens/note_screen.dart';
import 'package:learn_flutter/learn/screensaver/screensaver.dart';
import 'package:learn_flutter/timerdemo/stopwatch.dart';
import 'package:learn_flutter/widgettree/step_streambuilder.dart';

import 'collections/sets.dart';
import 'learn/signup/signup.dart';
import 'widgettree/materialbanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}