import 'package:kitchen_guide/domain/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<Profile?> getProfileByEmail(String email) async {
    Database db = await DBHelper.initDB();
    List<Map<String, dynamic>> user =
    await db.query(
      'Profile',
      where: 'email = ?',
      whereArgs: [email]
    );
    if (user.isEmpty) {
      return null;
    }
    return Profile.fromJson(user.first);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('loggedUserEmail');
  }

  Future<Profile?> getLoggedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isUserLogged = prefs.getBool('isUserLogged') ?? false;
    String currentUserEmail = prefs.getString('loggedUserEmail') ?? '';
    if (!isUserLogged) return null;

    Database db = await DBHelper.initDB();

    List<Map<String, dynamic>> res = await db.query(
        'Profile',
        where: 'email = ?',
        whereArgs: [currentUserEmail]
    );

    if (res.isNotEmpty) {
      Profile user = Profile.fromJson(res.first);
      return user;
    }
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

  Future<bool> validateUser(String email, String password) async {
    final db = await DBHelper.initDB();
    final result = await db.query(
      'Profile',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<bool> isAdmin(String email) async {
    return email == 'admin@';
  }

  Future<int> deleteAccount(String email) async {
    Database db = await DBHelper.initDB();
    if (await isAdmin(email)) return 0;
    return await db.delete(
      'Profile',
      where: 'email = ?',
      whereArgs: [email],
    );
  }
}