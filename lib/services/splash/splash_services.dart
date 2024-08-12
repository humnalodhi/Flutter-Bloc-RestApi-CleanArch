import 'dart:async';

import 'package:bloc_rest_api_clean_arch/config/routes/routes_names.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesNames.loginScreen,
        (route) => false,
      ),
    );
  }
}
