import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_flutter/learn/login/login.dart';
import 'package:learn_flutter/learn/signup/signup.dart';

class ScreenSaver extends StatefulWidget {
  const ScreenSaver({super.key});

  @override
  State<ScreenSaver> createState() => _ScreenSaverState();
}

class _ScreenSaverState extends State<ScreenSaver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage(
              "images/background.png"
            )
          )
        ),
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
                        style: TextStyle(color: Color(0xFF1F41BB),
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                      ),
                      Text(
                        "Dream Job here",
                        style: TextStyle(color: Color(0xFF1F41BB),
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                      ),
                    SizedBox(height: 20,),
                    Text("Explore all the existing job roles based on your \n                     interest and study major"),
                    SizedBox(height: 80,),
                    Row(
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF1F41BB),
                                minimumSize: Size(150, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                            )),
                        SizedBox(width: 15,),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(150, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold),
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
