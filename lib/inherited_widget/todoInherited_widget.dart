 import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:todo_app_f/shared/todoData_model.dart';

class TodoInheritedWidget extends InheritedWidget{ //Parents and child মত // সকল screen এ context এর মাধ্যমে পাওয়ার জন্য করা হয়েছে।
    TodoInheritedWidget( {
    super.key,
    required super.child,
    required this.dataContainer,
     required this.todoStreamController,
  }){
     todoStreamController.sink.add(dataContainer.todos); // প্রথমে todos list Stream এর ভিতরে Data add করবে।
   }

  final TodoDataContainer dataContainer;
  final  StreamController <List<Todos>> todoStreamController ;

  updateTodoStreamController(int index,Todos todos){
    dataContainer.todos[index] = todos;
    todoStreamController.sink.add(dataContainer.todos);
  }

  static TodoInheritedWidget? maybeOf(BuildContext context){ //যদি widget tree-তে TodoInheritedWidget থাকে, তাহলে সেটাকে return করে। না থাকলে null দেয়।
    return context.dependOnInheritedWidgetOfExactType<TodoInheritedWidget>();
  }

  static TodoInheritedWidget of(BuildContext context){ //same কাজ, তবে assert দিয়ে check করে নিশ্চয়তা দেয় TodoInheritedWidget আছে।
    final TodoInheritedWidget? result = maybeOf(context);
    assert(result != null,'No TodoInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TodoInheritedWidget oldWidget) =>
      dataContainer != oldWidget.dataContainer; //এটি বলে দেয়: TodoInheritedWidget যখন rebuild হয়, তখন নিচের widget গুলা notify পাবে কি না। যদি dataContainer এর reference পরিবর্তিত হয়, তাহলে notify করা হবে।

}