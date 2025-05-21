import 'package:flutter/material.dart';
import 'package:kitchen_guide/home_page.dart';
import 'package:kitchen_guide/splash_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    /*initialRoute: 'splash_page',
    routes: {
      'splash_page': (context) => splashPage(),
      'home_page': (context) => HomePage(),
      },*/
    )
  );
}