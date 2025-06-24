import 'package:flutter/material.dart';
import 'package:todo_app_f/inherited_widget/todoInherited_widget.dart';

import '../shared/todoData_model.dart';

class TodoDetailScreen extends StatefulWidget {
  static const String path ="/todo_detail";
  const TodoDetailScreen({super.key, required this.index});

  final int index;

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();

}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  final TextEditingController editingController = TextEditingController();





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

      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Current task:'),
                Text(todos[widget.index].task,style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                labelText: 'Task',
                hintText: 'Write the updated task here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ElevatedButton(
          onPressed: (){
            Todos currentTodo = todos[widget.index];
           currentTodo.task= editingController.text;
          TodoInheritedWidget.of(context).updateTodoStreamController(widget.index,  currentTodo);
          Navigator.pop(context);

        },
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple.shade400,
            foregroundColor: Colors.white
        ), child: Text('Confirm Edit'),),
        ],
      ),
    );  //Module:13,Class:12,T:58.08
  }


  @override
  void dispose() {
    editingController.clear();
    super.dispose();
  }
}
