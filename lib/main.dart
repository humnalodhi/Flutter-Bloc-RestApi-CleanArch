import 'package:bloc_rest_api_clean_arch/bloc/counter/counter_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/todo/todo_bloc.dart';
import 'package:bloc_rest_api_clean_arch/screens/todo_screen/todo_screen.dart';
import 'package:bloc_rest_api_clean_arch/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (_) => ImagePickerBloc(
            ImagePickerUtils(),
          ),
        ),
        BlocProvider(
          create: (_) => TodoBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
