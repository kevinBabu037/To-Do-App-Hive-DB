import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/colors.dart';
import 'package:to_do_app/core/height_width.dart';
import 'package:to_do_app/data/hive_service/hive_service.dart';
import 'package:to_do_app/data/model/todo.dart';
import 'package:to_do_app/presentation/home/bloc/bloc/todo_bloc_bloc.dart';
import 'package:to_do_app/presentation/home/widgets/todo_textform.dart';

class AddToDoTextFormAndButtonWidget extends StatelessWidget {
   AddToDoTextFormAndButtonWidget({
    super.key,
  });

  final HiveService service = HiveService();
  final toDoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    children: [    
       Expanded( 
        child: Padding( 
          padding: const EdgeInsets.only(left: 10,bottom: 15 ),
          child: ToDoTextFormFeild(toDoController: toDoController),
        )
        ), 
        kWidth10,
      Container(
        decoration: BoxDecoration(
          color: kClrPurple,
          borderRadius: BorderRadius.circular(20) 
        ),
        padding:const EdgeInsets.all(5),
        child: IconButton(  
        icon:const Icon(Icons.add),
        onPressed: (){
          if (toDoController.text.isNotEmpty) {
             context.read<TodoBlocBloc>().add(AddToDoEvent(
            toDo:TodoModel(title: toDoController.text, isCompleted: false)
            ));
            toDoController.clear();
          }
        },
        )
        ),
        kWidth10 
    ], 
        );
  }
}


