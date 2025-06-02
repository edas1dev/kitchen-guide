import 'package:flutter/material.dart';
import 'package:kitchen_guide/home_page.dart';
import 'package:kitchen_guide/onboardings/onboarding2.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
              'assets/images/foodOn1.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  'Descubra Receitas Personalizadas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      'Conte-nos suas preferências alimentares e nós',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      ' criaremos receitas deliciosas para você!',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFFEF233C),
                      ),
                      child: Text('Pular', style: TextStyle(fontWeight: FontWeight.w900)),
                    ),
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding2()));
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEF233C),
                      ),
                      child: Text('Próximo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}