import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<LoginEvent>(_emailLogin);
  }


  Future<void> _emailLogin(LoginEvent event, Emitter<SignInState> emit) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
    } on FirebaseAuthException catch (e) {
      print('error----${e.code}');
    }
  }
}
