import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/data/model/todo.dart';
import 'package:to_do_app/presentation/home/bloc/bloc/todo_bloc_bloc.dart';
import 'package:to_do_app/presentation/home/cubit/theme_cubit.dart';
import 'package:to_do_app/presentation/home/screen_home.dart';

void main()async{

   await Hive.initFlutter(); 
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit(),),
        BlocProvider<TodoBlocBloc>(create: (context) =>TodoBlocBloc(),),
       
      ],
      child:const MyApp(),
    ),
  ); 
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home:const ScreenHome(),
        );
      },
    );
  }
}
