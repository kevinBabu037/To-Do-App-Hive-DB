import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/home/widgets/add_todo_button.dart';
import 'package:to_do_app/presentation/home/widgets/app_bar.dart';
import 'package:to_do_app/presentation/home/widgets/todo_list.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const CustomAppBar(),
      body:Column(
        children: [ 
           const TodoListWidget(),
           AddToDoTextFormAndButtonWidget(),
        ],
      ),
    );
  }
}






