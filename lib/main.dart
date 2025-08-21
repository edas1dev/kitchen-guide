import 'package:flutter/material.dart';
import 'package:kitchen_guide/pages/display_page.dart';
import 'package:kitchen_guide/pages/onboardings/onboarding_builder.dart';
import 'package:kitchen_guide/pages/login/singUpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  bool isUserLogged = prefs.getBool('isUserLogged') ?? false;

  Widget page;
  if (!hasSeenOnboarding) {
    page = OnboardingBuilder(
      destinyPage: SingUpPage(destinyPage: DisplayPage()),
    );
  } else if (!isUserLogged) {
    page = SingUpPage(destinyPage: DisplayPage());
  } else {
    page = DisplayPage();
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: page,
    ),
  );
}