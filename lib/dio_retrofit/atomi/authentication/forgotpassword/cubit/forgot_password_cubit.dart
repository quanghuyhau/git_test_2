import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

import 'forgot_password_state.dart';


class ForgotPassCubit extends Cubit<ForgotPassState> {
  final Logger _logger = Logger();
  ForgotPassCubit() : super(ForgotPassInitial());

  Future<void> resetPassword(String email) async {
    emit(ForgotPassLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _logger.i("check email: $email để đổi lại mật khẩu");
      emit(ForgotPassSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        emit(ForgotPassFailure("Không tìm thấy người dùng nào cho email đó."));
      } else {
        emit(ForgotPassFailure("Đã xảy ra lỗi. Vui lòng thử lại."));
        _logger.e("Lỗi email ko tồn tại");
      }
    }
  }
}
