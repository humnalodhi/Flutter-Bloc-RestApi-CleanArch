import 'package:bloc_rest_api_clean_arch/config/routes/routes_names.dart';
import 'package:bloc_rest_api_clean_arch/data/exceptions/app_exceptions.dart';
import 'package:bloc_rest_api_clean_arch/utils/components/loading_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            throw NoInternetException('No internet Exception');
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LoadingWidget(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutesNames.postsScreen,
                );
              },
              child: const Text('Posts'),
            ),
          ],
        ),
      ),
    );
  }
}
