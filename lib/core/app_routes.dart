import 'package:flutter/cupertino.dart';
import 'package:todo_app_f/todo_detail/todoDetail_screen.dart';
import 'package:todo_app_f/todo_list/todoList_screen.dart';

class AppRoutes{
  static Map<String,WidgetBuilder> configurationRoutes(){
    return{
        TodolistScreen.path:(context)=> TodolistScreen(),
        TodoDetailScreen.path:(context){
         final int index = ModalRoute.of(context)?.settings.arguments as int;
         return TodoDetailScreen(index: index,);
        }
    };
  }
}