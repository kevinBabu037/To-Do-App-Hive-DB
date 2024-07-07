part of 'todo_bloc_bloc.dart';

@immutable
sealed class TodoBlocState {}

final class TodoBlocInitial extends TodoBlocState {}

final class TodoBlocLoadingState extends TodoBlocState {}

final class TodoBlocSuccessState extends TodoBlocState {
 final List<TodoModel> toDos;

  TodoBlocSuccessState({required this.toDos});
}

final class TodoBlocEmptyState extends TodoBlocState {}





