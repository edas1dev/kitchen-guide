import 'package:flutter/foundation.dart';
import 'package:kitchen_guide/domain/profile.dart';

class ProfileProvider extends ChangeNotifier {
  Profile? _user;
  bool _isUserLogged = false;
  String _loggedUserEmail = '';
  String? _cachedUserName;

  Profile? get profile => _user;
  bool get hasProfile => _user != null;
  bool get isUserLogged => _isUserLogged;
  String get loggedUserEmail => _loggedUserEmail;

  String get userName {
    try {
      final name = (_user as dynamic)?.name;
      if (name is String && name.isNotEmpty) return name;
    } catch (_) {}
    return _cachedUserName ?? '';
  }

  void setProfile(Profile profile) {
    _user = profile;
    _cachedUserName = null;
    notifyListeners();
  }

  void clearProfile() {
    _user = null;
    _cachedUserName = null;
    _isUserLogged = false;
    _loggedUserEmail = '';
    notifyListeners();
  }

  void setIsUserLogged(bool value) {
    _isUserLogged = value;
    notifyListeners();
  }

  void setLoggedUserEmail(String email) {
    _loggedUserEmail = email;
    // tenta refletir no objeto _user se possível (copyWith ou campo editável)
    try {
      final user = _user as dynamic;
      if (user != null) {
        if (user.copyWith != null) {
          _user = user.copyWith(email: email);
        } else {
          user.email = email;
        }
      }
    } catch (_) {}
    notifyListeners();
  }

  void setUserName(String name) {
    _cachedUserName = name;
    try {
      final user = _user as dynamic;
      if (user != null) {
        if (user.copyWith != null) {
          _user = user.copyWith(name: name);
        } else {
          user.name = name;
        }
      }
    } catch (_) {}
    notifyListeners();
  }
}
