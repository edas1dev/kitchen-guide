import 'package:flutter/material.dart';
import 'package:kitchen_guide/domain/recipe.dart';
import 'package:kitchen_guide/pages/homepage/recipe_card.dart';

class RecipeCarousell extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Recipe> recipes;
  const RecipeCarousell({super.key, required this.title, required this.subtitle, required this.recipes});

  @override
  State<RecipeCarousell> createState() => _RecipeCarousellState();
}

class _RecipeCarousellState extends State<RecipeCarousell> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Text(widget.title, style:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Spacer(),
              Text(widget.subtitle, style:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFFEF233C)),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 270,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 25),
            scrollDirection: Axis.horizontal,
            itemCount: widget.recipes.length,
            itemBuilder: (context, i) => RecipeCard(recipe: widget.recipes[i]),
          ),
        )
      ],
    );
  }
}
