import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      // Thực hiện xử lý đăng nhập ở đây. Ví dụ: kiểm tra email và password.
      await Future.delayed(Duration(seconds: 2)); // Giả lập đăng nhập.

      if (event.email == "test@example.com" && event.password == "password") {
        yield LoginSuccess();
      } else {
        yield LoginFailure(error: "Email hoặc mật khẩu không hợp lệ.");
      }
    }
  }
}
