import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/model/todo.dart';
import 'package:to_do_app/presentation/home/bloc/bloc/todo_bloc_bloc.dart';
import 'package:to_do_app/presentation/home/widgets/edit_to_do.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    super.key,
    required this.data,
    required this.index
  });
  final int index;
  final TodoModel data;

  @override
  Widget build(BuildContext context) {
    return ListTile(  
      leading: Checkbox(
        value: data.isCompleted,  
        onChanged: (value) {
          context.read<TodoBlocBloc>().add(UpdateTodoEvent( 
            toDo: TodoModel(title: data.title, isCompleted: value??false), 
             index: index
             )
             );
        }
        ),
      title:  Text(data.title), 
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'edit') {  
            showEditDialogWidget(context, index,data.title);
          } else if (value == 'delete') {
             context.read<TodoBlocBloc>().add(DeleteTodoEvent(index: index));
          }
        }, 
        itemBuilder: (BuildContext context) { 
          return [
            const PopupMenuItem(
              value: 'edit',
              child: Text('Edit'), 
            ),
            const PopupMenuItem( 
              value: 'delete',
              child: Text('Delete'), 
            ),
          ];
        },
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}