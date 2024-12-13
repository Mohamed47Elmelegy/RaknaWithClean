import 'dart:convert';

import 'package:clean_rakna/Features/auth/domain/entity/user_entities.dart';

import '../../Features/auth/data/models/user_model.dart';
import '../constants/prefs.dart';
import '../services/shared_preferences_sengltion.dart';

UserEntities getUser() {
  var jsonString = Prefs.getString(SharedPrefs.userData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
