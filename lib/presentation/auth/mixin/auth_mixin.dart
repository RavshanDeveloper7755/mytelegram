
import 'package:flutter/cupertino.dart';
import 'package:telegram/presentation/auth/auth_sign_up/auth.dart';
import 'package:telegram/presentation/auth/auth_sign_in/auth_sign_in.dart';

mixin AuthMixin on State<Auth>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}

mixin SignInMixin on State<SignIn>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}