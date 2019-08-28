import 'package:flutter/material.dart';
import 'package:pizzaSensei/util/dbhelper.dart';

import 'package:pizzaSensei/model/todo.dart';
 
class Orders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Orders();
}

class _Orders extends State {
   
     List<Todo> todos = new List<Todo>();
     DBHelper helper = new DBHelper();
     int count = 0;
  @override
  Widget build(BuildContext context) {

    /*   helper.initializeDB().then(
        (result) => helper.getTodos().then((result)=>todos=result)
      );
    DateTime today = DateTime.now();
    Todo todo = Todo("Mozarilla",today.toString(),2,"Pizza with Mozarilla Cheese");
     helper.insertTodo(todo); */
    
     
  }
  void getData(){
    final dbFuture = helper.initializeDB();
    dbFuture.then((result){
      final todosFuture = helper.getTodos();
      todosFuture.then((result){
       List<Todo> todoList = new List<Todo>();
       count = result.length;
       for(int i ;i<count;i++){
         todoList.add(Todo.fromObject(result[i]) );
         debugPrint(todoList[i]);
         
       }
 

      });
      
      

    });
  }
}
