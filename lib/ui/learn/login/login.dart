import 'package:flutter/material.dart';
import 'package:learn_flutter/ui/learn/authen/forgot_password.dart';
import 'package:learn_flutter/ui/learn/home/homescreen.dart';
import 'package:learn_flutter/ui/learn/screensaver/screensaver.dart';
import '../signup/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void _signIn() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty) {
      setState(() {
        _emailError = "Email không được để trống";
      });
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      setState(() {
        _emailError = "Email không hợp lệ";
      });
    }

    if (password.isEmpty) {
      setState(() {
        _passwordError = "Password không được để trống";
      });
    } else if (password.length < 6) {
      setState(() {
        _passwordError = "Password phải có ít nhất 6 ký tự";
      });
    }

    if (_emailError == null && _passwordError == null) {
      // Thực hiện đăng nhập
      // TODO: Thêm mã xử lý đăng nhập tại đây
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading:  TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFF1F4FF),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenSaver()));
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
             image: AssetImage("images/background.png")
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Login here",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF1F41BB),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        "Welcome back you've \n       been missed!",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 74,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      fillColor: Color(0xFFF1F4FF),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF1F41BB)),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(20),
                      errorText: _emailError,
                    ),
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFF1F4FF),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1F41BB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(20),
                      errorText: _passwordError,
                    ),
                  ),
                ),
                SizedBox(
                  height: 31,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF1F41BB),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF1F41BB),
                        minimumSize: Size(350, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: _signIn,
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF),
                        minimumSize: Size(300, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Create new account",
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  height: 64,
                ),
                Text(
                  "Or continue with",
                  style: TextStyle(
                      color: Color(0xFF1F41BB), fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFECECEC),
                      ),
                      width: 60,
                      height: 44,
                      alignment: Alignment.center,
                      child: Image.asset("images/gg.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFECECEC),
                      ),
                      width: 60,
                      height: 44,
                      alignment: Alignment.center,
                      child: Image.asset("images/fb.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFECECEC),
                      ),
                      width: 60,
                      height: 44,
                      alignment: Alignment.center,
                      child: Image.asset("images/apple.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
