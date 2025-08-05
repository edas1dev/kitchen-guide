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

  Future<void> setRecipeBookmarkedState(int recipe_id, bool is_bookmarked) async {
    Database db = await DBHelper().initDB();

    String sql = 'UPDATE Recipes SET bookmarked = ? WHERE id = ?;';
    await db.update(
      'Recipes',
      { 'bookmarked': is_bookmarked },
      where: 'id = ?',
      whereArgs: [recipe_id]
    );
  }
}