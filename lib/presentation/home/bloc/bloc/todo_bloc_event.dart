part of 'todo_bloc_bloc.dart';

@immutable
sealed class TodoBlocEvent {}


class GetAllToDoEvent extends TodoBlocEvent{}

class AddToDoEvent extends TodoBlocEvent{
 final TodoModel toDo;
 AddToDoEvent({required this.toDo});
}

class DeleteTodoEvent extends TodoBlocEvent{
 final int index;
 DeleteTodoEvent({required this.index});
}

class UpdateTodoEvent extends TodoBlocEvent{
 final TodoModel toDo;
  final int index;
 UpdateTodoEvent({required this.toDo,required this.index});
}
