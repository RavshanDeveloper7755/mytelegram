part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
}

class SignUpEvent extends AuthEvent{
  final String email;
  final String password;

  SignUpEvent({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];

}
