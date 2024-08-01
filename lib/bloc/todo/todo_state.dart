import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  const TodoState({
    this.todoList = const [],
  });

  final List<String> todoList;

  TodoState copyWith({List<String>? todoList}) {
    return TodoState(
      todoList: todoList ?? this.todoList,
    );
  }

  @override
  List<Object> get props => [
        todoList,
      ];
}
