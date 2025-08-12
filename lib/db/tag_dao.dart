import 'package:kitchen_guide/domain/tag.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class TagDao {
  Future<List<Tag>> listarPopularTags() async {
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

  Future<List<Tag>> listarRecentTags() async {
    List<Tag> listaTags = [];
    Database db = await DBHelper.initDB();

    String sql = 'SELECT * FROM RecentTags ORDER BY createdAt DESC;';
    var listResult = await db.rawQuery(sql);

    for (var json in listResult) {
      Tag tag = Tag.fromJson(json);
      listaTags.add(tag);
    }

    return listaTags;
  }

  Future<void> insertRecentTag(Tag tag) async {
    Database db = await DBHelper.initDB();

    bool tagExiste = (await db.rawQuery(
      'SELECT * FROM RecentTags WHERE nome = ?',
      [tag.nome]
    )).isNotEmpty;
    if (tagExiste) return;

    int tagsTableSize = (await listarRecentTags()).length;
    if (tagsTableSize >= 4) {
      await db.delete(
          'RecentTags',
          where: 'nome = (SELECT nome FROM RecentTags ORDER BY createdAt ASC LIMIT 1)'
      );
    }

    await db.insert(
      'RecentTags',
      {
        'nome': tag.nome,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}