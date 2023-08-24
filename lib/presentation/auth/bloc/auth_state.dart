part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool numberVisible;

  const AuthState({
    this.numberVisible = true,
  });

  AuthState copyWith({
    bool? numberVisible,
  }) =>
      AuthState(
        numberVisible: numberVisible ?? this.numberVisible,
      );

  @override
  List<Object?> get props => [numberVisible];
}