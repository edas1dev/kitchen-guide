import 'package:kitchen_guide/domain/tag.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class TagDao {
  Future<List<Tag>> listarTags() async {
    List<Tag> listaTags = [];
    Database db = await DBHelper.initDB();

    String sql = 'SELECT * FROM PopularTags;';
    var listResult = await db.rawQuery(sql);

    for (var json in listResult) {
      Tag tag = Tag.fromJson(json);
      listaTags.add(tag);
    }

    return listaTags;
  }
}