import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }


  static void buildOnBoarding(bool isBuilt) {
    prefs.setBool("buildOnBoarding", isBuilt);
  }

  static bool getBuildOnBoarding() {
    return prefs.getBool("buildOnBoarding")??false;
  }
}
