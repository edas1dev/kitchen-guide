import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/profile_dao.dart';
import 'package:kitchen_guide/pages/display_page.dart';
import 'package:kitchen_guide/pages/onboardings/onboarding_builder.dart';
import 'package:kitchen_guide/login/singUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget page = DisplayPage();
  if(!await ProfileDao().isUserLogged())
    page = OnboardingBuilder(destinyPage: SingUpPage(destinyPage: page),);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: page
    )
  );
}
