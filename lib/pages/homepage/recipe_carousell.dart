import 'package:flutter/material.dart';
import 'package:kitchen_guide/api/recipe_api.dart';
import 'package:kitchen_guide/domain/recipe.dart';
import 'package:kitchen_guide/domain/recipe_list.dart';
import 'package:kitchen_guide/pages/homepage/recipe_card.dart';

class RecipeCarousell extends StatefulWidget {
  final RecipeList recipeList;
  const RecipeCarousell({super.key, required this.recipeList});

  @override
  State<RecipeCarousell> createState() => _RecipeCarousellState();
}

class _RecipeCarousellState extends State<RecipeCarousell> {
  late Future<List<Recipe>> recipesData;
  @override
  void initState() {
    recipesData = RecipeApi().getRecipes(widget.recipeList.list);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Text(widget.recipeList.title, style:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Spacer(),
              Text('Ver mais', style:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFFEF233C)),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 290,
          child: FutureBuilder(
            future: recipesData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator(),);
              }
              List<Recipe> recipes = snapshot.requireData;
              return ListView.builder(
                padding: EdgeInsets.only(left: 25),
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (context, i) => RecipeCard(recipe: recipes[i]),
              );
            },
          )
        )
      ],
    );
  }
}
