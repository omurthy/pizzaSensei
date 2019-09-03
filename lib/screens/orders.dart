import 'package:flutter/material.dart';
import 'package:pizzaSensei/util/dbhelper.dart';

import 'package:pizzaSensei/model/todo.dart';

class Orders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Orders();
}

class _Orders extends State {
  List<Todo> todos;
  DBHelper helper = DBHelper();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    /*   helper.initializeDB().then(
        (result) => helper.getTodos().then((result)=>todos=result)
      );
            DateTime today = DateTime.now();
      Todo todo =  Todo("Mozarilla", today.toString(), 2, "Pizza with Mozarilla Cheese");
      helper.insertTodo(todo);
    DateTime today = DateTime.now();
    Todo todo = Todo("Mozarilla",today.toString(),2,"Pizza with Mozarilla Cheese");
     helper.insertTodo(todo); */
    if (todos == null) {
      todos = List<Todo>();

      getData();
    }
    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
          onPressed: null, tooltip: "Add new Todo", child: new Icon(Icons.add)),
    );
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(this.todos[position].id.toString()),
            ),
            title: Text(this.todos[position].title),
            subtitle: Text(this.todos[position].date),
            onTap: () {
              debugPrint("Tapped on " + this.todos[position].id.toString());
            },
          ),
        );
      },
    );
  }

  void getData() {
    final dbFuture = helper.initializeDB();
    dbFuture.then((result) {
      debugPrint("1 todos starting ");
      final todosFuture = helper.getTodos();
      debugPrint("todos starting ");
      todosFuture.then((result) {
        debugPrint("todos entered "+ result.length.toString());
        List<Todo> todoList = new List<Todo>();
        count = result.length;
        for (int i=0; i < count; i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }
         setState(() {
          todos = todoList;
          count = count;
        });  
        debugPrint("ITEMS " + count.toString());  
      });
    });
  }
}
