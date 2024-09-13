import 'dart:async';
import 'package:bloc_rest_api_clean_arch/config/routes/routes_names.dart';
import 'package:bloc_rest_api_clean_arch/services/session_manager/session_controller.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreference().then((value) {
      if (SessionController().isLogin ?? false) {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesNames.moviesScreen,
            (route) => false,
          ),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesNames.loginScreen,
            (route) => false,
          ),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNames.loginScreen,
          (route) => false,
        ),
      );
    });
  }
}
