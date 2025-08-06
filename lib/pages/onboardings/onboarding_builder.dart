import 'package:flutter/material.dart';

import 'onboarding.dart';

class OnboardingBuilder extends StatefulWidget {
  final Widget destinyPage;
  const OnboardingBuilder({super.key, required this.destinyPage});

  @override
  State<OnboardingBuilder> createState() => _OnboardingBuilderState();
}

class _OnboardingBuilderState extends State<OnboardingBuilder> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (this._currentPage < 1) {
      this._pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget.destinyPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        onPageChanged: (index) => setState(() => this._currentPage = index),
        physics: NeverScrollableScrollPhysics(),
        children: [
          Onboarding(
            image: Image.asset('assets/images/foodOn1.jpg'),
            title: 'Descubra Receitas Personalizadas',
            text: 'Conte-nos suas preferências alimentares e nós criaremos receitas deliciosas para você!',
            onNext: _nextPage,
            jumpPage: widget.destinyPage,
          ),
          Onboarding(
            image: Image.asset('assets/images/foodOn2.jpg'),
            title: 'Digitalize ingredientes para gerar receitas',
            text: 'Use o recurso de Busca para gerar receitas com os ingredientes prontamente disponíveis com você!',
            onNext: _nextPage,
            jumpPage: widget.destinyPage,
          ),
        ],
      ),
    );
  }
}
