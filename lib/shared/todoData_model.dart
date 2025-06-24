

class TodoDataContainer{
  List<Todos>todos=[
    Todos(task: 'Complete the homework', isDone: false),
    Todos(task: 'Clean the bedroom', isDone: false),
    Todos(task: 'Wash the car', isDone: false),
    Todos(task: 'Do exercise(50 push-up)', isDone: false),
  ];
}
class Todos{

  String task;
  bool isDone;

  Todos({required this.task, required this.isDone});
}