import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/screensaver/ui/screensaver.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/signup/cubit/signup_cubit.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized(

  );
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCKy6D47OUlrarAFernMXqpIoYfbZ6NkSA",
          projectId: "demoweather-82272",
          messagingSenderId: "873114703765",
          appId: "1:873114703765:android:f2de746a0e623dc2bf089c",
          storageBucket: "demoweather-82272.appspot.com"
      )
  );
  // configureDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenSaver(),
      ),
    );
  }
}