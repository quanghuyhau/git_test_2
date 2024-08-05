import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/login/cubit/login_cubit.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/login/ui/login_screen.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/signup/cubit/signup_cubit.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/signup/ui/signup_screen.dart';
import 'package:learn_flutter/dio_retrofit/atomi/di/di.dart';
import 'package:logger/logger.dart';

class ScreenSaver extends StatefulWidget {
  const ScreenSaver({super.key});

  @override
  State<ScreenSaver> createState() => _ScreenSaverState();
}

class _ScreenSaverState extends State<ScreenSaver> {
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/background.png"))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                    height: 422, child: Image.asset("images/group.png")),
              ),
              Container(
                width: 343,
                child: Column(
                  children: [
                    Text(
                      "Discover Your",
                      style: TextStyle(
                          color: Color(0xFF1F41BB),
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    Text(
                      "Dream Job here",
                      style: TextStyle(
                          color: Color(0xFF1F41BB),
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Explore all the existing job roles based on your \n                     interest and study major"),
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF1F41BB),
                                minimumSize: Size(150, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BlocProvider(
                                          create: (context) =>
                                              getIt<LoginCubit>(),
                                          child: LoginScreen(),
                                        )),
                              );
                              if (result != null) {
                                _logger.w(result);
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(150, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider(
                                            create: (context) => getIt<SignUpCubit>(),
                                            child: SignupScreen(),
                                          )));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
