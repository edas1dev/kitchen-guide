import 'package:kitchen_guide/db/db_helper.dart';
import 'package:kitchen_guide/db/profile_dao.dart';
import 'package:sqflite/sqflite.dart';

class RecipeDao {
  Future<List<String>> getAllBookmarkedIds() async {
    Database db = await DBHelper.initDB();
    String userEmail = await ProfileDao().getUserEmail() ?? '';

    var result = await db.query(
      'BookmarkedRecipes',
      columns: ['apiId'],
      where: 'userEmail = ?',
      whereArgs: [userEmail],
    );

    return result
        .map((row) => row['apiId'] as String)
        .toList();
  }

  Future<bool> toggleBookmark(int recipeApiId) async {
    Database db = await DBHelper.initDB();
    String userEmail = await ProfileDao().getUserEmail() ?? '';

    final int deletedCount = await db.delete(
      'BookmarkedRecipes',
      where: 'apiId = ? AND userEmail = ?',
      whereArgs: [recipeApiId.toString(), userEmail],
    );

    if (deletedCount > 0) {
      return false;
    }

    await db.insert(
      'BookmarkedRecipes',
      {
        'apiId': recipeApiId.toString(),
        'userEmail': userEmail,
      },
    );

    return true;
  }

  Future<bool> isBookmarked(int recipeApiId) async {
    Database db = await DBHelper.initDB();
    String userEmail = await ProfileDao().getUserEmail() ?? '';
    try {
      final List<Map<String, dynamic>> result = await db.query(
        'BookmarkedRecipes',
        where: 'apiId = ? AND userEmail = ?',
        whereArgs: [recipeApiId.toString(), userEmail],
      );

      return result.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}