import 'package:kitchen_guide/domain/profile.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class ProfileDao {
  // Método para inserir um novo perfil
  // Usamos 'replace' no conflictAlgorithm para que, se você tentar inserir
  // um perfil com um email que já existe (e se o email for UNIQUE na tabela),
  // ele substitua o antigo.
  Future<void> insertProfile(Profile profile) async {
    Database db = await DBHelper.initDB();
    await db.insert(
      'Profile', // Nome da tabela
      profile.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> isUserLogged() async {
    Database db = await DBHelper.initDB();
    String sql = 'SELECT * FROM Profile;';
    var listResult = await db.rawQuery(sql);
    return listResult.isNotEmpty;
  }

  Future<Profile?> getFirstUser() async {
    Database db = await DBHelper.initDB();

    String sql = 'SELECT * FROM Profile;';
    List<Map<String, dynamic>> maps = await db.rawQuery(sql);

    if (maps.isNotEmpty)
      return Profile.fromJson(maps.first);

    return null;
  }
}