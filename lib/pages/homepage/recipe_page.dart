import 'package:flutter/material.dart';
import 'package:kitchen_guide/api/recipe_api.dart';
import 'package:kitchen_guide/api/translate_api.dart';
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
          List<String> ingredientsNames = fullRecipe.extendedIngredients.map((item) => item.original).toList();
          Future<String> translatedIngredients = TranslateApi().translateToPortuguese(ingredientsNames.join('|'));
          return ListView(
            children: [
              Stack(
                children: [
                  Image.network(
                    fullRecipe.image,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon:  Icon(Icons.close, color: Colors.white, size: 48,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ),
                  ),
                ]
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
                    FutureBuilder(
                      future: translatedIngredients,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }

                        List<String> ingredientsList = snapshot.requireData.split('|');
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: ingredientsList.map<Widget>(
                            (item) =>
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Icon(Icons.circle, size: 6,),
                                  ),
                                  Expanded(child: Text(item, softWrap: true,))
                                ]
                              )
                            )
                          ).toList(),
                        );
                      },
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
