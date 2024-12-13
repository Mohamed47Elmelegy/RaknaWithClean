import 'package:clean_rakna/Features/Auth/presentation/SignIn/view/signin_view.dart';
import 'package:clean_rakna/Features/Auth/presentation/signUp/view/signup_view.dart';
import 'package:clean_rakna/Features/Auth/presentation/splash/view/splash_app.dart';
import 'package:flutter/material.dart';
import '../../../Features/DashBord/view/dashboard_view.dart';
import 'page_routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case PageRoutesName.signin:
        return MaterialPageRoute(builder: (context) => const SigninView());
      case PageRoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case PageRoutesName.dashBoard:
        return MaterialPageRoute(builder: (context) => const DashBoardView());
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
