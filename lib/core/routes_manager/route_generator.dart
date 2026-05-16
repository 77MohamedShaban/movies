import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/routes_manager/routes_name.dart';
import 'package:movies/features/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:movies/features/auth/presentation/screens/log_in/log_in_screen.dart';
import 'package:movies/features/intro/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:movies/features/main_layout/main_layout.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/auth/presentation/screens/sign_up/sign_up_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return PageTransition(
          type: PageTransitionType.fade,
          child: OnBoardingScreen(),
        );
      case RoutesName.signUp:
        return PageTransition(
          type: PageTransitionType.fade,
          child: SignUpScreen(),
        );
      case RoutesName.logIn:
        return PageTransition(
          type: PageTransitionType.fade,
          child: LogInScreen(),
        );
      case RoutesName.forgetPassword:
        return PageTransition(
          type: PageTransitionType.fade,
          child: ForgetPasswordScreen(),
        );
      case RoutesName.mainLayout:
        return PageTransition(
          type: PageTransitionType.fade,
          child: MainLayout(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return PageTransition(
      type: PageTransitionType.fade,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsManager.splashscreen),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
