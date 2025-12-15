import 'package:flutter/foundation.dart';
import 'package:kitchen_guide/domain/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/profile_api.dart';
import '../db/profile_dao.dart';

class ProfileProvider extends ChangeNotifier {
  Profile? _user;

  Profile? get profile => _user;
  bool get hasProfile => _user != null;

  String get userName => _user?.nome ?? '';
  String get email => _user?.email ?? '';

  Future<void> loadUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userEmail = prefs.getString('loggedUserEmail');
      if (userEmail == null) {
        print('Nenhum email de utilizador encontrado.');
        return;
      }
      final profileApi = ProfileApi();
      final profileDao = ProfileDao();
      Profile? loaded;
      try {
        loaded = await profileApi.fetchProfileByEmail(userEmail);
      } catch (_) {
        loaded = await profileDao.getProfileByEmail(userEmail);
      }
      if (loaded != null) {
        setProfile(loaded);

        notifyListeners();
      } else {
        print('Perfil não encontrado nem na API nem no banco local.');
      }
    } catch (e) {
      print('Erro ao carregar perfil do usuário: $e');
    }
  }

  void setProfile(Profile profile) {
    _user = profile;
    notifyListeners();
  }

  void clearProfile() {
    _user = null;
    notifyListeners();
  }

  void setLoggedUserEmail(String email) {
    if (_user == null) return;

    _user = _user!.copyWith(email: email);
    notifyListeners();
  }

  void setUserName(String name) {
    if (_user == null) return;

    _user = _user!.copyWith(nome: name);
    notifyListeners();
  }
}
