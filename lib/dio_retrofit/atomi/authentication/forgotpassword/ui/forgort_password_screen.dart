import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/forgotpassword/cubit/forgot_password_cubit.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/forgotpassword/cubit/forgot_password_state.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/login/ui/login_screen.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});

  final TextEditingController mailcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPassCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFF1F4FF),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  _textForgotPass(),
                  _enterEmail(),
                  _buttonResetPass(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textForgotPass() {
    return Column(
      children: [
        Center(
          child: Text(
            "Forgot Password",
            style: TextStyle(
              color: Color(0xFF1F41BB),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Enter Your Email Account To Reset \n                   Your Password",
          style: TextStyle(fontSize: 17),
        ),
      ],
    );
  }

  Widget _enterEmail() {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 50),
      width: 350,
      child: Form(
        key: _formkey,
        child: TextFormField(
          controller: mailcontroller,
          decoration: InputDecoration(
            fillColor: Color(0xFFF1F4FF),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1F41BB)),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Email',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(20),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buttonResetPass() {
    return BlocConsumer<ForgotPassCubit, ForgotPassState>(
      listener: (context, state) {
        if (state is ForgotPassSuccess) {
          final email = mailcontroller.text;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.deepPurple,
            content: Text(
              "Vui lòng truy cập Email: $email để đặt lại mật khẩu mới của bạn!",
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
          ));
        } else if (state is ForgotPassFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              state.errorMessage,
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
          ));
        }
      },
      builder: (context, state) {
        if (state is ForgotPassLoading) {
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
              final email = mailcontroller.text;
              context.read<ForgotPassCubit>().resetPassword(email);
            }
          },
          child: Text(
            "Reset Password",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }
}
