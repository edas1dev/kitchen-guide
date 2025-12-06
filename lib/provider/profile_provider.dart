import 'package:flutter/foundation.dart';
import 'package:kitchen_guide/domain/profile.dart';

class ProfileProvider extends ChangeNotifier {
  Profile? _user;

  Profile? get profile => _user;

  void setProfile(Profile profile) {
    _user = profile;
    notifyListeners();
  }

  void clearProfile() {
    _user = null;
    notifyListeners();
  }

  bool get hasProfile => _user != null;
}
