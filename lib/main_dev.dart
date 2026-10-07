import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes_manager/routes_name.dart';

import 'core/di/di.dart';
import 'core/remote/local/prefs_manager.dart';
import 'core/resources/app_theme.dart';
import 'core/routes_manager/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  await PrefsManager.init();
  configureDependencies();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'movies',
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: _getInitialRoute(),
      ),
    );
  }

  String _getInitialRoute() {
    if (!PrefsManager.getBuildOnBoarding()) {
      return RoutesName.onBoarding;
    }
    if (FirebaseAuth.instance.currentUser != null) {
      return RoutesName.mainLayout;
    } else {
      return RoutesName.logIn;
    }
  }
}
