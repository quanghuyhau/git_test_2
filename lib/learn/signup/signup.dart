import 'package:flutter/material.dart';
import '../login/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  void _signUp() {
    setState(() {
      _emailError = null;
      _passwordError = null;
      _confirmPasswordError = null;
    });

    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

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

    if (confirmPassword.isEmpty) {
      setState(() {
        _confirmPasswordError = "Password không được để trống";
      });
    } else if (confirmPassword != password) {
      setState(() {
        _confirmPasswordError = " Password không khớp";
      });
    }

    if (_emailError == null && _passwordError == null && _confirmPasswordError == null) {

      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      print('Đăng ký thành công');
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
                      "Create Account",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF1F41BB),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Create an account so you can explore all the \n                              existing jogs",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
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
                height: 29,
              ),
              Container(
                width: 350,
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Color(0xFFF1F4FF),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1F41BB)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(20),
                    errorText: _confirmPasswordError,
                  ),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              SizedBox(
                height: 28,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF1F41BB),
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _signUp,
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFFFFFFF),
                  minimumSize: Size(300, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Already have an account",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 40,
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
