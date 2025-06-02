import 'package:flutter/material.dart';
import 'package:kitchen_guide/onboardings/onboarding1.dart';
import 'package:kitchen_guide/onboardings/onboarding2.dart';
import 'package:kitchen_guide/profile/user_profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // TODO: classe para o Onboarding e para os Container do profile page
    //home: ProfilePage(),
    home: Onboarding1(),
    )
  );
}