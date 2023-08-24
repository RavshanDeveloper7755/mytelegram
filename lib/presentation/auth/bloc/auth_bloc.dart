import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<SignUpEvent>(_emailSignUp);
    on<LoginEvent>(_emailLogin);
  }

  Future<void> _emailSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      // emit(state.copyWith(firebaseStatus: Status.success));
    } on FirebaseAuthException catch (e) {
      print('error----${e.code}');
      // emit(state.copyWith(firebaseStatus: Status.error));
    }
  }

  Future<void> _emailLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      // emit(state.copyWith(firebaseStatus: Status.success));
    } on FirebaseAuthException catch (e) {
      print('error----${e.code}');
      // emit(state.copyWith(firebaseStatus: Status.error));
    }
  }
}
