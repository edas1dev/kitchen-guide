import 'package:kitchen_guide/domain/profile.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class ProfileDao {
  // Método para inserir um novo perfil
  // Usamos 'replace' no conflictAlgorithm para que, se você tentar inserir
  // um perfil com um email que já existe (e se o email for UNIQUE na tabela),
  // ele substitua o antigo.
  Future<void> insertProfile(Profile profile) async {
    Database db = await DBHelper().initDB();
    await db.insert(
      'Profile', // Nome da tabela
      profile.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Recupera um único perfil pelo e-mail
  Future<Profile?> getProfileByEmail(String email) async {
    Database db = await DBHelper().initDB();
    List<Map<String, dynamic>> maps = await db.query(
      'Profile',
      where: 'email = ?', // Condição WHERE para filtrar pelo e-mail
      whereArgs: [email], // Argumento para a condição WHERE
      limit: 1, // Limita o resultado a apenas um registro
    );

    if (maps.isNotEmpty) {
      // Se encontrou algum resultado, converte o primeiro (e único) para Profile
      return Profile.fromJson(maps.first);
    }
    return null;
  }

  // método existente para listar todos os perfis (pode ser útil)
  /*Future<List<Profile>> listarProfiles() async {
    List<Profile> listaProfile = [];
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM Profile;';
    var listResult = await db.rawQuery(sql);

    for (var json in listResult) {
      Profile profile = Profile.fromJson(json);
      listaProfile.add(profile);
    }

    return listaProfile;
  }*/
}