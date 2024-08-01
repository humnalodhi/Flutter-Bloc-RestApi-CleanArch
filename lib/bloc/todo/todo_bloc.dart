import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/todo/todo_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addToDoEvent);
    on<RemoveTodoEvent>(_removeToDoEvent);
  }

  void _addToDoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    todoList.add(event.task);
    emit(
      state.copyWith(
        todoList: List.from(
          todoList,
        ),
      ),
    );
  }
  void _removeToDoEvent(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todoList.remove(event.task);
    emit(
      state.copyWith(
        todoList: List.from(
          todoList,
        ),
      ),
    );
  }
}
