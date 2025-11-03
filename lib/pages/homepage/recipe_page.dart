import 'package:flutter/material.dart';
import 'package:kitchen_guide/api/recipe_api.dart';
import 'package:kitchen_guide/domain/full_recipe.dart';

class RecipePage extends StatefulWidget {
  final int recipeId;
  const RecipePage({super.key, required this.recipeId});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late Future<FullRecipe?> recipe;

  @override
  void initState() {
    recipe = RecipeApi().getFullRecipe(widget.recipeId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: recipe,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xFFE41D56))
            );
          }
          if (snapshot.requireData == null) {
            return Center(
              child: Text("Não foi possível encontrar a receita."),
            );
          }
          FullRecipe fullRecipe = snapshot.requireData!;
          List<String> dietary = fullRecipe.dietaryInfo;
          List<ExtendedIngredient> ingredients = fullRecipe.extendedIngredients;
          return ListView(
            children: [
              Image.network(
                fullRecipe.image,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      fullRecipe.title,
                      style: TextStyle(fontSize: 17.8, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: dietary.map<Widget>(
                          (diet) =>
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            margin: EdgeInsets.only(left: 5, top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                border: Border.all(color: Color(0xFFEC3D6F),width: 2),
                                color: Colors.white
                            ),
                            child: Text(diet, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFEC3D6F))),
                          )
                        ).toList()
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      child: Text('Ingredientes:', textAlign: TextAlign.justify, style: TextStyle(fontSize: 17.8, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: ingredients.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          String imageUrl = 'https://img.spoonacular.com/ingredients_100x100/${ingredients[i].image}';
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            child: Row(
                              spacing: 8,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  child: Image.network(imageUrl, width: 50, fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container();
                                    },
                                  ),
                                ),
                                Text(ingredients[i].name)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      child: Text('Receita:', textAlign: TextAlign.justify, style: TextStyle(fontSize: 17.8, fontWeight: FontWeight.bold),),
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      fullRecipe.summary,
                      style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      )
    );
  }
}
