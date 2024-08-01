import 'package:flutter/material.dart';
import 'package:learn_flutter/ui/learn/authen/otp.dart';
import 'package:learn_flutter/ui/learn/login_bloc/login_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:  TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Color(0xFFF1F4FF),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/background.png"
            )
          )
        ) ,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Center(
                    child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: Color(0xFF1F41BB),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter Your Email Account To Reset \n                   Your Password",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 50,),
                Container(
                  width: 350,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFF1F4FF),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1F41BB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'xxxxxxxx',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF1F41BB),
                        minimumSize: Size(350, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
