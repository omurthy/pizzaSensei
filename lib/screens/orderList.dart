import 'package:flutter/material.dart';
import 'package:pizzaSensei/util/dbhelper.dart';

import 'package:pizzaSensei/screens/orderDetail.dart';

import 'package:pizzaSensei/model/todo.dart';

import 'home.dart';
import 'prices.dart';

final List<String> choices = ['Prices', 'Back to Home'];
const String mnuPrices = 'Prices';
const String mnuBackToHome = 'Back to Home';

class OrderList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderList();
}

class _OrderList extends State {
  List<Todo> todos;
  DBHelper helper = DBHelper();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    /*   helper.initializeDB().then(
        (result) => helper.getTodos().then((result)=>todos=result)
      ); 
      DateTime today = DateTime.now();
      Todo todo =  Todo("Mozarilla", 3, today.toString(), "With Mozarilla cheese ");
      helper.insertTodo(todo);
     */
    if (todos == null) {
      todos = List<Todo>();

      getData();
    }
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: select,
          itemBuilder: (BuildContext context) {
            return choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ]),
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationToDetail(Todo("", 1, ""));
          },
          tooltip: "Add new Todo",
          child: new Icon(Icons.add)),
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
              backgroundColor: getColor(this.todos[position].priority),
              child: Text(this.todos[position].priority.toString()),
            ),
            title: Text(this.todos[position].title),
            subtitle: Text(this.todos[position].description),
            onTap: () {
              debugPrint("Tapped on " + this.todos[position].id.toString());
              navigationToDetail(this.todos[position]);
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
        debugPrint("todos entered " + result.length.toString());
        List<Todo> todoList = new List<Todo>();
        count = result.length;
        for (int i = 0; i < count; i++) {
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

  Color getColor(int priority) {
    switch (priority) {
      case 2:
        return Colors.red;
        break;
      case 3:
        return Colors.orange;
        break;
      case 1:
        return Colors.green;
        break;
      default:
    }
  }

  void navigationToDetail(Todo todo) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrderDetail(todo)));
    if (result == true) {
      getData();
    }
  }

  void select(String value) {
    switch (value) {
      case mnuBackToHome:
      Navigator.push(context, MaterialPageRoute(builder:(context)=>Home()));
        break;
      case mnuPrices:
      Navigator.push(context, MaterialPageRoute(builder:(context)=>Prices()));
        break;
      default:
    }
  }
}
