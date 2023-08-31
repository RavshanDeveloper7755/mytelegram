import 'package:flutter/material.dart';
import 'package:telegram/presentation/auth/auth_sign_in/auth_sign_in.dart';
import 'package:telegram/presentation/auth/auth_sign_up/auth.dart';

import '../main_page/main_page.dart';
import 'name_routes.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // final args = settings.arguments as Map<String, dynamic>;

      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case Routes.registr:
        return MaterialPageRoute(builder: (_) => const Auth());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const SignIn());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}