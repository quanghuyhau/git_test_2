
import 'package:equatable/equatable.dart';

abstract class ForgotPassState extends Equatable {
  const ForgotPassState();

  @override
  List<Object> get props => [];
}

class ForgotPassInitial extends ForgotPassState {}

class ForgotPassLoading extends ForgotPassState {}

class ForgotPassSuccess extends ForgotPassState {}

class ForgotPassFailure extends ForgotPassState {
  final String errorMessage;

  const ForgotPassFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
