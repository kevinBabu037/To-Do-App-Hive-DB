import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/data/hive_service/hive_service.dart';
import 'package:to_do_app/data/model/todo.dart';
part 'todo_bloc_event.dart'; 
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(TodoBlocInitial()) {

    HiveService service = HiveService();

    List<TodoModel> allTodos =[]; 

    on<GetAllToDoEvent>((event, emit) {
      emit(TodoBlocLoadingState());
     Box<TodoModel> todoBox =  service.getTodoBox();
         if (todoBox.isNotEmpty) {
           allTodos = todoBox.values.toList();
           emit(TodoBlocSuccessState(toDos: allTodos));
         }else{
           emit(TodoBlocEmptyState());
         } 
    });
 
    on<AddToDoEvent>((event, emit) async{
      allTodos.add(event.toDo);
       await service.addTodo(event.toDo);  
       emit(TodoBlocSuccessState(toDos: allTodos)); 
    });

    on<DeleteTodoEvent>((event, emit) async{
      allTodos.removeAt(event.index);
      await service.deleteTodo(event.index);
        emit(TodoBlocSuccessState(toDos: allTodos));
       
    });

    on<UpdateTodoEvent>((event, emit) async{
      await service.updateTodo(event.index, event.toDo);
      emit(TodoBlocSuccessState(toDos: service.getTodos()));
    });





  }
}
