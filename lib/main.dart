import 'package:flutter/material.dart';
import 'package:kitchen_guide/category/categories.dart';
import 'package:kitchen_guide/homepage/home_page.dart';
import 'package:kitchen_guide/onboardings/onboarding_builder.dart';
import 'package:kitchen_guide/profile/user_profile.dart';
import 'package:kitchen_guide/search/search.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    )
  );
}