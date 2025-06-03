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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Digitalize ingredientes para gerar receitas',
                    style: TextStyle(fontSize: 18.6, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Use o recurso Pesquise & Ache, para gerar receitas com os ingredientes prontamente disponíveis com você!',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Spacer(),
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
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding2()));
                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFEF233C),
                        ),
                        child: Text('Próximo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
