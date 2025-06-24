import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app_f/todo_detail/todoDetail_screen.dart';

import '../inherited_widget/todoInherited_widget.dart';
import '../shared/todoData_model.dart';

class TodolistScreen extends StatefulWidget {
  static const String path ='/todo_list';
  const TodolistScreen({super.key});

  @override
  State<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {

  @override
  Widget build(BuildContext context) {
  List<Todos> todos = TodoInheritedWidget.of(context).dataContainer.todos;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade600,
        title: Text('Todo list screen',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),
      ),

      body: StreamBuilder<List<Todos>>( // কিভাবে StreamBuilder use করতে হয়?
        stream: TodoInheritedWidget.of(context).todoStreamController.stream, // stream কি?
        builder: (context, snapshot) {
         return ListView.builder( // কিভাবে ListViewBuilder use করতে হয়?
              itemCount: snapshot.data?.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(snapshot.data![index].task,
                      style: TextStyle(
                          decoration: snapshot.data![index].isDone ? TextDecoration.lineThrough: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),),
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min
                    ,
                    children: [
                      if(snapshot.data![index].isDone)
                        IconButton(onPressed: (){
                          todos.removeAt(index);
                          TodoInheritedWidget.of(context).todoStreamController.sink.add(snapshot.data!); // Data

                        }, icon: Icon(Icons.delete)),
                      if(!snapshot.data![index].isDone)
                        IconButton(onPressed: (){
                          todos[index].isDone = true;
                          TodoInheritedWidget.of(context).todoStreamController.sink.add(snapshot.data!);

                        }, icon: Icon(Icons.check)),
                      IconButton(onPressed: (){
                        Navigator.pushNamed(context, TodoDetailScreen.path,arguments: index);
                      }, icon: Icon(Icons.edit)),
                    ],
                  ),

                ) ;
              });
        },
      ),
    );
  }
}
















