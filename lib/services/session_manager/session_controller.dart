import 'dart:convert';

import 'package:bloc_rest_api_clean_arch/model/user_model.dart';
import 'package:bloc_rest_api_clean_arch/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';

class SessionController {
  static final SessionController sessionController =
      SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel userModel = UserModel();
  bool? isLogin;

  /// This constructor protects the class to creating multiple class instances.
  SessionController._internal() {
    isLogin = false;
  }

  /// Factory constructor is a special kind of constructor that returns existing class constructor.
  factory SessionController() {
    return sessionController;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController().userModel =
            UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
