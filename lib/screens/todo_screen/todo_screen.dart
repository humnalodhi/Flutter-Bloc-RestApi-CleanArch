import 'package:bloc_rest_api_clean_arch/bloc/todo/todo_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/todo/todo_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text('No todos found!'),
            );
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.todoList[index],
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      context.read<TodoBloc>().add(
                            RemoveTodoEvent(
                              task: state.todoList[index],
                            ),
                          );
                    },
                  ),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context.read<TodoBloc>().add(
                  AddTodoEvent(
                    task: 'Task: $i',
                  ),
                );
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
