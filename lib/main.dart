import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app_f/shared/todoData_model.dart';
import 'package:todo_app_f/todo_list/todoList_screen.dart';

import 'core/app_routes.dart';
import 'inherited_widget/todoInherited_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamController<List<Todos>> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TodoInheritedWidget(
      dataContainer: TodoDataContainer(),
      todoStreamController: _streamController,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.configurationRoutes(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const TodolistScreen(),
      ),
    );
  }



  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}


