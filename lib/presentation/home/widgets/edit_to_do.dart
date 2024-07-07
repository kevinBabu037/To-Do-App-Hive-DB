 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/model/todo.dart';
import 'package:to_do_app/presentation/home/bloc/bloc/todo_bloc_bloc.dart';

showEditDialogWidget(BuildContext context, int index,String title) {
    TextEditingController controller = TextEditingController(text: title);
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Edit Todo Item'),
          content: TextField(
            controller: controller,
            decoration:const InputDecoration(hintText: 'Enter new todo item'), 
          ),
          actions: <Widget>[
            TextButton(
              child:const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
            TextButton(
              child:const Text('Save'),
              onPressed: () {
                context.read<TodoBlocBloc>().add(
                UpdateTodoEvent(
                 toDo: TodoModel.copyWith(title: controller.text),
                 index: index));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }