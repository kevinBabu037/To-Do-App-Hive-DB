import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/hive_service/hive_service.dart';
import 'package:to_do_app/presentation/home/bloc/bloc/todo_bloc_bloc.dart';
import 'package:to_do_app/presentation/home/widgets/todo_tile.dart';

class TodoListWidget extends StatefulWidget {
   const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final HiveService service = HiveService();
 
  
  @override
  void initState() {
    context.read<TodoBlocBloc>().add(GetAllToDoEvent()); 
     super.initState();  
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TodoBlocBloc, TodoBlocState>(
        builder: (context, state) {
          if (state is TodoBlocLoadingState) {
            return const Center(child: CircularProgressIndicator(),);
          } 
          if (state is TodoBlocSuccessState) { 
            return ListView.separated(
              itemBuilder: (context, index) {
                final data = state.toDos[index];
                return TodoTileWidget(data: data,index: index,);
              },
              separatorBuilder: (context, index) => const Divider(thickness: 0.3),
              itemCount: state.toDos.length,
            );
          }  
          return const Center(child: Text('Empty To-DO'),);
        },
      ),
    );
  }
}


