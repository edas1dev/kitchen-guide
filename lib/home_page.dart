import 'package:flutter/material.dart';
import 'package:kitchen_guide/bottom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Opa'),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
