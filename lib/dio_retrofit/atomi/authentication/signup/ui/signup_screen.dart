import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/login/ui/login_screen.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/signup/cubit/signup_cubit.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/signup/cubit/signup_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            // Show loading indicator
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Đang đăng ký...'),
              ),
            );
          } else if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Đăng ký thành công'),
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              ),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image:
            DecorationImage(image: AssetImage("images/background.png")),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _createAccount(),
                  _emailSignUp(),
                  _passwordSignUp(),
                  _confirmPassSignUp(),
                  _buttonSignUp(),
                  _alreadyHaveAnAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFF1F4FF),
        ),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Kết quả'),
              content: Text('Dữ liệu nhận được: $result'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );

          // if (result is List<bool> && result.first == true) {
          //   print('--------------------result');
          //   print(result);
          // }
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  _createAccount() {
    return Container(
      padding: EdgeInsets.only(bottom: 60),
      child: Column(
        children: [
          Text(
            "Create Account",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xFF1F41BB),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 22),
          Text(
            "Create an account so you can explore all the \n                              existing jogs",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  _emailSignUp() {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      width: 350,
      child: TextFormField(
        controller: mailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập Email';
          }
          // Regular expression for valid email address
          if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
              .hasMatch(value)) {
            return 'Vui lòng nhập đúng định dạng email';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Email',
          fillColor: Color(0xFFF1F4FF),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1F41BB)),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  _passwordSignUp() {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      width: 350,
      child: TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập Password';
          }
          if (value.length < 6) {
            return 'Mật khẩu phải có ít nhất 6 ký tự';
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

  _confirmPassSignUp() {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      width: 350,
      child: TextFormField(
        controller: confirmPasswordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập lại Password';
          }
          if (value != passwordController.text) {
            return 'Mật khẩu không khớp';
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
          labelText: 'Confirm Password',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  _buttonSignUp() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFF1F41BB),
          minimumSize: Size(350, 50),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () async {
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate()) {
            final email = mailController.text;
            final password = passwordController.text;
            final confirmPassword = confirmPasswordController.text;

            context
                .read<SignUpCubit>()
                .signUp(email, password, confirmPassword);
          }
        },
        child: Text(
          "Sign up",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _alreadyHaveAnAccount() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color(0xFFFFFFFF),
        minimumSize: Size(300, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account?",
              style: TextStyle(color: Colors.black, fontSize: 17)),
          Text(" Login", style: TextStyle(color: Colors.blue, fontSize: 17)),
        ],
      ),
    );
  }
}
