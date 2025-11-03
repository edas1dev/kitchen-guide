import 'package:flutter/material.dart';
import 'package:kitchen_guide/api/recipe_api.dart';
import 'package:kitchen_guide/pages/homepage/bookmark_button.dart';

import '../../../db/recipe_dao.dart';
import '../../../domain/recipe.dart';
import '../../homepage/recipe_page.dart';

class SavedRecipesOPT extends StatefulWidget {
  const SavedRecipesOPT({super.key});

  @override
  State<SavedRecipesOPT> createState() => _SavedRecipesOPTState();
}

class _SavedRecipesOPTState extends State<SavedRecipesOPT> {
  List<Recipe> savedRecipes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    List<String> savedRecipesIds = await RecipeDao().getAllBookmarkedIds();
    savedRecipes = await RecipeApi().getRecipes(savedRecipesIds);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, backgroundColor: Colors.white,
        title: Text('Receitas Salvas', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 25),
        itemCount: savedRecipes.length,
        itemBuilder: (context, i) {
          Recipe recipe = savedRecipes[i];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RecipePage(recipeId: recipe.id,)));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 24, left: 25, right: 25),
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
                    child: Image.network(
                      recipe.image,
                      height: double.infinity,
                      width: 93,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child:
                              Text(recipe.title, style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: BookmarkButton(recipeId: recipe.id)
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
