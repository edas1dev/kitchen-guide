import 'package:flutter/material.dart';
import 'package:kitchen_guide/onboardings/onboarding_builder.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingBuilder()
    )
  );
}