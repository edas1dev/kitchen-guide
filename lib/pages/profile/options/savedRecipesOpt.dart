import 'package:flutter/material.dart';

class SavedRecipesOPT extends StatefulWidget {
  const SavedRecipesOPT({super.key});

  @override
  State<SavedRecipesOPT> createState() => _SavedRecipesOPTState();
}

class _SavedRecipesOPTState extends State<SavedRecipesOPT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, backgroundColor: Colors.white,
        title: Text('Receitas Salvas', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD9D9D9).withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              width: double.infinity,
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(13),
                      bottomLeft: Radius.circular(13),
                    ),
                    child: Image.asset(
                      'assets/images/recipes/bolo.jpg',
                      height: double.infinity,
                      width: 93,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Nome da comida.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('outra coisa se precisar.'),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.bookmark, size: 40, color: const Color(0xFFEF233C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD9D9D9).withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              width: double.infinity,
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(13),
                      bottomLeft: Radius.circular(13),
                    ),
                    child: Image.asset(
                      'assets/images/recipes/macarrao.jpg',
                      height: double.infinity,
                      width: 93,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Nome da comida.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('outra coisa se precisar.'),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.bookmark, size: 40, color: const Color(0xFFEF233C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD9D9D9).withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              width: double.infinity,
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(13),
                      bottomLeft: Radius.circular(13),
                    ),
                    child: Image.asset(
                      'assets/images/recipes/espaguete.jpg',
                      height: double.infinity,
                      width: 93,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Nome da comida.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('outra coisa se precisar.'),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.bookmark, size: 40, color: const Color(0xFFEF233C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD9D9D9).withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              width: double.infinity,
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(13),
                      bottomLeft: Radius.circular(13),
                    ),
                    child: Image.asset(
                      'assets/images/recipes/salada.jpg',
                      height: double.infinity,
                      width: 93,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Nome da comida.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('outra coisa se precisar.'),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.bookmark, size: 40, color: const Color(0xFFEF233C)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
