import 'package:flutter/material.dart';

class ContainerSavedRecipes extends StatefulWidget {
  const ContainerSavedRecipes({super.key});

  @override
  State<ContainerSavedRecipes> createState() => _ContainerSavedRecipesState();
}

class _ContainerSavedRecipesState extends State<ContainerSavedRecipes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD9D9D9).withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ]
      ),
      width: double.infinity,
      height: 80,
      child: Row(
        spacing: 10,
        children: [
          Icon(Icons.bookmark, size: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Receitas salvas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('Suas receitas salvas se encontram aqui.'),
            ],
          )
        ],
      ),
    );
  }
}
