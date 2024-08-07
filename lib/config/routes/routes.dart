import 'package:bloc_rest_api_clean_arch/config/routes/routes_names.dart';
import 'package:bloc_rest_api_clean_arch/screens/login_screen/login_screen.dart';
import 'package:bloc_rest_api_clean_arch/screens/posts_screen/posts_screen.dart';
import 'package:bloc_rest_api_clean_arch/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RoutesNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RoutesNames.postsScreen:
        return MaterialPageRoute(
          builder: (context) => const PostsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'No route generated',
                ),
              ),
            );
          },
        );
    }
  }
}
