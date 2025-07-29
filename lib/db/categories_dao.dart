import 'package:kitchen_guide/domain/category.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class CategoriesDao {
  Future<List<Category>> listarPropriedades() async {
    List<Category> listaCategorias = [];
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM Categories;';
    var listResult = await db.rawQuery(sql);

    for (var json in listResult) {
      Category category = Category.fromJson(json);
      listaCategorias.add(category);
    }

    return listaCategorias;
  }
}