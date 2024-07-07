import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  bool isCompleted;

  TodoModel({required this.title, this.description, required this.isCompleted});

 static TodoModel copyWith({
    String? title,
    String? description,
    bool? isCompleted,  
  }) {
    return TodoModel(
      title: title ?? title!,
      description: description ?? description,
      isCompleted: isCompleted ?? isCompleted??false,
    );
  }
}
