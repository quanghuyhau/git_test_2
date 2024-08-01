import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_flutter/ui/learn/authen/forgot_password.dart';
import 'package:learn_flutter/ui/learn/login/login.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();

}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFF1F4FF),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotPassScreen()));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/background.png"
            )
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Center(
                    child: Text(
                  "OTP Verification",
                  style: TextStyle(
                      color: Color(0xFF1F41BB),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please Check Your Email To See The \n                  Verification Code",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(right: 200),
                  child: Text(
                    "OTP Code",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Pinput(
                    length: 4,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    defaultPinTheme: PinTheme(
                      width: 80,
                      height: 60,
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4FF),
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),

                  ),
                ),
                SizedBox(height: 50,),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF1F41BB),
                        minimumSize: Size(350, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Resend code to"),
                      Text("00:30"),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
