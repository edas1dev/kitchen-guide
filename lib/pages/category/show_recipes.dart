import 'package:flutter/material.dart';
import 'package:kitchen_guide/domain/category.dart';
import 'package:kitchen_guide/domain/recipe.dart';
import 'package:kitchen_guide/domain/simple_recipe.dart';

import '../../api/categories_api.dart';
import '../../api/translate_api.dart';

class ShowRecipes extends StatefulWidget {
  final Category category;
  const ShowRecipes({super.key, required this.category});

  @override
  _ShowRecipesState createState() => _ShowRecipesState();
}

class _ShowRecipesState extends State<ShowRecipes> {
  late Future<List<SimpleRecipe>> simpleRecipesList;
  @override
  void initState() {
    simpleRecipesList = CategoriesApi().getRecipes(widget.category.query);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: FutureBuilder(
          future: simpleRecipesList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildBody(snapshot.requireData);
            }

            return Center(
              child: CircularProgressIndicator(color: Color(0xFFE41D56),)
            );
          },
        ),
      ),
    );
  }

  buildBody(List<SimpleRecipe> recipes) {
    return ListView.builder(
     itemCount: recipes.length,
     padding: EdgeInsets.only(top: 15),
     itemBuilder: (context, i) {
       Future<String> translatedTitle = TranslateApi().translateToPortuguese(recipes[i].title);
       return FutureBuilder(
         future: translatedTitle,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             return Padding(
                 padding: EdgeInsets.symmetric(horizontal: 25),
                 child: buildCard(recipes[i], snapshot.requireData)
             );
           }

           return Center(
               child: CircularProgressIndicator(color: Color(0xFFE41D56),)
           );
         },
       );
     });
  }

  buildCard(SimpleRecipe recipe, String realTitle) {
    return InkWell(
      borderRadius: BorderRadius.circular(13),
      child: Container(
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
            ]),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  realTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  softWrap: true,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
              child: Image.network(
                recipe.image,
                height: 80,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        widget.category.titulo,
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
