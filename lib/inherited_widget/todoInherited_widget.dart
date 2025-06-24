 import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:todo_app_f/shared/todoData_model.dart';

class TodoInheritedWidget extends InheritedWidget{  // সকল screen এ context এর মাধ্যমে পাওয়ার জন্য করা হয়েছে।
    TodoInheritedWidget( {
    super.key,
    required super.child,
    required this.dataContainer,
     required this.todoStreamController,
  }){
     todoStreamController.sink.add(dataContainer.todos);
   }

  final TodoDataContainer dataContainer;
  final  StreamController <List<Todos>> todoStreamController ;

  updateTodoStreamController(int index,Todos todos){
    dataContainer.todos[index] = todos;
    todoStreamController.sink.add(dataContainer.todos);
  }

  static TodoInheritedWidget? maybeOf(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<TodoInheritedWidget>();
  }

  static TodoInheritedWidget of(BuildContext context){
    final TodoInheritedWidget? result = maybeOf(context);
    assert(result != null,'No TodoInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TodoInheritedWidget oldWidget) =>
      dataContainer != oldWidget.dataContainer;

}