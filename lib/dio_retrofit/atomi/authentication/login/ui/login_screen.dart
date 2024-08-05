import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/forgotpassword/ui/forgort_password_screen.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/login/cubit/login_cubit.dart';
import 'package:learn_flutter/dio_retrofit/atomi/home/ui/home_screen.dart';
import '../../signup/ui/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController useremailcontroller = TextEditingController();
  final TextEditingController userpasswordcontroller = TextEditingController();

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
            Navigator.pop(context, 'Huyyyyyyyyyyyyyyyyyy');
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png")),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                _loginHere(),
                _emailLogin(),
                _passwordLogin(),
                _forgotPassLogin(),
                _buttonLogin(),
                _createAccount(context),
                _orContinueWith(),
                _otherMethod(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginHere() {
    return Container(
      padding: EdgeInsets.only(bottom: 75),
      child: Column(
        children: [
          Text(
            "Login here",
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF1F41BB),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 22),
          Text(
            "Welcome back you've \n       been missed!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailLogin() {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      width: 350,
      child: TextFormField(
        controller: useremailcontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập Email';
          }
          if (!value.contains('@')) {
            return 'Định dạng Email không hợp lệ';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Email',
          fillColor: Color(0xFFF1F4FF),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1F41BB)),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _passwordLogin() {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      width: 350,
      child: TextFormField(
        controller: userpasswordcontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập Password';
          }
          return null;
        },
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
        ),
      ),
    );
  }

  Widget _forgotPassLogin() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgotPassScreen()));
        },
        child: Padding(
          padding: EdgeInsets.only(left: 200),
          child: Text(
            "Forgot your password?",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF1F41BB),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Đăng nhập thành công!',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return CircularProgressIndicator();
        }
        return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF1F41BB),
            minimumSize: Size(350, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            if (_formkey.currentState!.validate()) {
              final email = useremailcontroller.text;
              final password = userpasswordcontroller.text;
              context.read<LoginCubit>().login(email, password);
            }
          },
          child: Text(
            "Sign in",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }

  Widget _createAccount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 65),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFFFFFFF),
          minimumSize: Size(300, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupScreen()),
          );
        },
        child: Text(
          "Create new account",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _orContinueWith() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        "Or continue with",
        style: TextStyle(
          color: Color(0xFF1F41BB),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _otherMethod() {
    return Row(
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
        SizedBox(width: 10),
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
        SizedBox(width: 10),
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
    );
  }
}
