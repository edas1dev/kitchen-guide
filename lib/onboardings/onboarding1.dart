import 'package:flutter/material.dart';

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
          Image.network('https://img.freepik.com/fotos-premium/dieta-cetonica-de-comida-saudavel-salada-fresca-com-file-de-frango-e-legumes-em-imagem-vertical-preta_1040174-430.jpg'),
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
                        'Descubra Receitas Personalizadas',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 70),
                  child: Column(
                    spacing: 5,
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