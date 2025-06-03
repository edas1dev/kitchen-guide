import 'package:flutter/material.dart';
import '../home_page.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.network(
            'https://media.istockphoto.com/id/1387274503/photo/mobile-food-photography-minimal.jpg?s=612x612&w=0&k=20&c=oeuYIbIN0PrneTVFIJi6IGGRSqw9g7qJ_69un9idPoA=',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text(
                  'Digitalize ingredientes e gere receitas',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Column(
                  spacing: 5,
                  children: [
                    Text(
                      'Use o recurso de busca, para gerar receitas',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      ' com os ingredientes disponíveis com você!',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEF233C),
                      ),
                      child: Text('Iniciar experiência', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
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
