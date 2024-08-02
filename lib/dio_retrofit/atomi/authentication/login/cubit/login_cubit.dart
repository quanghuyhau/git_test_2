import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Logger _logger = Logger();

  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _logger.i('Đăng nhập thành công tài khoản: $email and password: $password');
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('Email không tồn tại!'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Mật khẩu không chính xác!'));
      } else {
        emit(LoginFailure('Đăng nhập thất bại: ${e.message}'));
        _logger.e("Đăng nhập thất bại");
      }
    } catch (e) {
      emit(LoginFailure('Đăng nhập thất bại: $e'));
    }
  }
}
