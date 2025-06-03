import 'package:flutter/material.dart';

import 'onboardings/onboarding2.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Onboarding2(
      imageUrl: 'https://media.istockphoto.com/id/1387274503/photo/mobile-food-photography-minimal.jpg?s=612x612&w=0&k=20&c=oeuYIbIN0PrneTVFIJi6IGGRSqw9g7qJ_69un9idPoA=',
      title: 'Digitalize ingredientes para gerar receitas',
      text: 'Use o recurso Pesquise & Ache, para gerar receitas com os ingredientes prontamente disponíveis com você!',
    ),
    )
  );
}