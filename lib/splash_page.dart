import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {

  void iniciarSplash() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, 'home_page');
  }

  @override
  void initState() {
    iniciarSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xC),
      body: Center(
        child: SvgPicture.asset('images/logo_white.svg', height: 220, width: 220),
      ),
    );;
  }
}
