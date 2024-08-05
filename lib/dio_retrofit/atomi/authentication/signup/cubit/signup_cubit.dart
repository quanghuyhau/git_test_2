import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_flutter/dio_retrofit/atomi/authentication/signup/cubit/signup_state.dart';
import 'package:logger/logger.dart';
@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final Logger _logger = Logger();

  SignUpCubit() : super(SignUpInitial());



  Future<void> signUp(
      String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      emit(SignUpFailure('Mật khẩu không khớp'));
      return;
    }
    emit(SignUpLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      _logger.i('Đăng ký thành công tài khoản: $email and password: $password');
      emit(SignUpSuccess(userCredential.user?.email ?? ''));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure('Mật khẩu của bạn phải có ít nhất 6 ký tự'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure('Tài khoản đã tồn tại'));
      } else {
        emit(SignUpFailure('Đăng ký thất bại'));
      }
    } catch (e) {
      emit(SignUpFailure('Đăng ký thất bại'));
    }
  }
}
