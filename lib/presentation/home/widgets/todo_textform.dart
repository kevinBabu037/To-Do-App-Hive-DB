import 'package:flutter/material.dart';

class ToDoTextFormFeild extends StatelessWidget {
  const ToDoTextFormFeild({
    super.key,
    required this.toDoController,
  });

  final TextEditingController toDoController;

  @override
  Widget build(BuildContext context){ 
    return TextFormField(
            controller: toDoController,
              decoration:const InputDecoration(
                filled: true, 
                 hintText: 'Add To-do',  
                 border: OutlineInputBorder(
                 borderSide: BorderSide.none,   
                )
              ),
            );
  }
}