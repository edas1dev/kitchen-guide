import 'package:flutter/material.dart';
import '../home_page.dart';

class Onboarding extends StatefulWidget {
  final Image image;
  final String title;
  final String text;
  final VoidCallback onNext;
  const Onboarding({super.key, required this.image, required this.title, required this.text, required this.onNext});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image(
            image: widget.image.image,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.8, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFFEF233C),
                        ),
                        child: Text('Pular', style: TextStyle(fontWeight: FontWeight.w900)),
                      ),
                      ElevatedButton(onPressed: () {
                        widget.onNext();
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
