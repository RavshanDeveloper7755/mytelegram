part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
}

class LoginEvent extends SignInEvent{
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];

}
