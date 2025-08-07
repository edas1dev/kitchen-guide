import 'package:kitchen_guide/domain/profile.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class ProfileDao {
  Future<void> insertProfile(Profile profile) async {
    Database db = await DBHelper.initDB();
    await db.insert(
      'Profile',
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

  Future<int> updateUserName(String oldEmail, String newName) async {
    Database db = await DBHelper.initDB();
    return await db.update(
      'Profile',
      {'nome': newName},
      where: 'email = ?',
      whereArgs: [oldEmail],
    );
  }

  Future<int> updateUserEmail(String oldEmail, String newEmail) async {
    Database db = await DBHelper.initDB();
    return await db.update(
      'Profile',
      {'email': newEmail},
      where: 'email = ?',
      whereArgs: [oldEmail],
    );
  }

  Future<int> updateUserPassword(String email, String newPassword) async {
    Database db = await DBHelper.initDB();
    return await db.update(
      'Profile',
      {'password': newPassword},
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  Future<int> deleteAccount(String email) async {
    Database db = await DBHelper.initDB();
    return await db.delete(
      'Profile',
      where: 'email = ?',
      whereArgs: [email],
    );
  }
}