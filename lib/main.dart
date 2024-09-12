import 'package:bloc_rest_api_clean_arch/bloc/favorite_app/favorite_app_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/posts/posts_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/todo/todo_bloc.dart';
import 'package:bloc_rest_api_clean_arch/config/routes/routes_names.dart';
import 'package:bloc_rest_api_clean_arch/repository/auth/login_http_api_repository.dart';
import 'package:bloc_rest_api_clean_arch/repository/auth/login_repository.dart';
import 'package:bloc_rest_api_clean_arch/repository/favorite_repository.dart';
import 'package:bloc_rest_api_clean_arch/repository/posts_repository.dart';
import 'package:bloc_rest_api_clean_arch/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'config/routes/routes.dart';

GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ImagePickerBloc(
            ImagePickerUtils(),
          ),
        ),
        BlocProvider(
          create: (_) => TodoBloc(),
        ),
        BlocProvider(
          create: (_) => FavoriteAppBloc(
            FavoriteRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => PostsBloc(
            PostsRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // themeMode: ThemeMode.dark,
        theme: ThemeData(
          // brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        initialRoute: RoutesNames.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ) ,
    );
  }
}

///Singleton pattern is a design patterns. It ensures that a class has a single instance and provides a global access point to this instance.

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginHttpApiRepository(),
  );
}
