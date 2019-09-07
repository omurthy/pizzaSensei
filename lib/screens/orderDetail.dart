import 'package:flutter/material.dart';
import 'package:pizzaSensei/util/dbhelper.dart';
import 'package:intl/intl.dart';

import 'package:pizzaSensei/model/todo.dart';

DBHelper helper = DBHelper();
final List<String> choices = const <String>[
  'Save Order & Back',
  'Delete Order',
  'Back to List'
];
const mnuSave = "Save Order & Back";
const mnuDelete = "Delete Order";
const mnuBack = "Back to List";

class OrderDetail extends StatefulWidget {
  final Todo todo;
  OrderDetail(this.todo);
  @override
  State<StatefulWidget> createState() => OrderDetailState(todo);
}

class OrderDetailState extends State {
  Todo todo;

  OrderDetailState(this.todo);
  final _priorities = ["High", "Medium", "Low"];
  String _priorirty = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;

    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
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
          ],
          automaticallyImplyLeading: false,
          title: Text(todo.title),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10, left: 35, right: 10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value)=>this.updateTitle(),
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value)=>this.updateDescription(),
                    decoration: InputDecoration(
                        labelText: "Description",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              ListTile(
                  title: DropdownButton<String>(
                items: _priorities.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style: textStyle,
                value: retrievePriority(todo.priority),
                onChanged: (value)=>updatePriority(value),
              )),
            ],
          ),
        ));
    return null;
  }

  void select(String value) async {
    int result;
    switch (value) {
      case mnuSave:
        save();
        break;
      case mnuDelete:
        Navigator.pop(context, true);
        if (todo.id == null) {
          return;
        }
        result = await helper.deleteTodo(todo.id);
        if (result != 0) {
          AlertDialog alertDialog = AlertDialog(
            title: Text("Deleted "),
            content: Text('The Todo has been deleted'),
          );
          showDialog(context: context, builder: (_) => alertDialog);
        }
        break;
      case mnuBack:
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  void save() {
    todo.date = new DateFormat.yMd().format(DateTime.now());
    if (todo.id != null) {
      helper.updateTodo(todo);
    } else {
      helper.insertTodo(todo);
    }
    Navigator.pop(context, true);
  }

  void updatePriority(value) {
    switch (value) {
      case "High":
        todo.priority = 1;
        break;
      case "Medium":
        todo.priority = 2;
        break;
      case "Low":
        todo.priority = 3;
        break;
    }
    setState(() {
      _priorirty = value;
    });
  }

  String retrievePriority(int value) {
    return _priorities[value - 1];
  }

  void updateTitle(){
    todo.title =titleController.text ;

  }
  void updateDescription(){
    todo.description = descriptionController.text;
  }
}
