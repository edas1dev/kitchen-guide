import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/db_helper.dart';
import 'package:kitchen_guide/pages/onboardings/onboarding_builder.dart';

void main() {
  DBHelper.initDB();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingBuilder()
    )
  );
}