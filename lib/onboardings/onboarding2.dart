import 'package:flutter/material.dart';

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
          Image.network('https://media.istockphoto.com/id/1387274503/photo/mobile-food-photography-minimal.jpg?s=612x612&w=0&k=20&c=oeuYIbIN0PrneTVFIJi6IGGRSqw9g7qJ_69un9idPoA='),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        'Digitalize ingredientes para gerar receitas',
                        style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 80),
                  child: Column(
                    spacing: 5,
                    children: [
                      Text(
                        'Use o recurso Pesquise & Ache, para gerar receitas ',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'com os ingredientes prontamente disponíveis com você!',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFFEF233C),
                        ),
                        child: Text(
                          'Pular',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFEF233C),
                        ),
                        child: Text(
                          'Próximo',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
