import 'package:kitchen_guide/db/db_helper.dart';
import 'package:kitchen_guide/domain/recipe.dart';
import 'package:sqflite/sqflite.dart';

class RecipeDao {
  Future<List<Recipe>> getAllRecipes() async {
    Database db = await DBHelper().initDB();
    List<Recipe> recipeList = [];

    String sql = 'SELECT * FROM Recipes;';
    var listResult = await db.rawQuery(sql);

    for (var json in listResult) {
      Recipe recipe = Recipe.fromJson(json);
      recipeList.add(recipe);
    }

    return recipeList;
  }
}