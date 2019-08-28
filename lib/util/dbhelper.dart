import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pizzaSensei/model/todo.dart';

//author: omuralcinthy@gmail.com

class DBHelper {
  /* First time craeting an instance for using every calling with factory method */
  static final DBHelper _dbHelper = new DBHelper._internal();
 
  String tblTodo = "todo";
  String colId = "id"; 
  String colTitle = "title"; 
  String colDescription = "description"; 
  String colPriority = "priority"; 
  String colDate = "date"; 

  /* Named constructer */
  DBHelper._internal();

  /* the factory is a keyword which provides 'Singleton' creation of same instance */
  factory DBHelper(){
    return _dbHelper;
  }

  static Database _db;
  Future<Database> get db async {
    if(_db == null){
      _db =await initializeDB();
    }
    return _db;
  }


  Future<Database> initializeDB() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todos.db";
    var dbTodos =await openDatabase(path,version: 1 ,onCreate: _createDb);
    return dbTodos;
  }


  void _createDb(Database db, int version) async {
    await db.execute("CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY,$colTitle TEXT,$colDescription TEXT,$colPriority INTEGER,$colDate TEXT)");
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result;
  }

  Future<List> getTodos() async {
    Database db = await this.db;
    var result = db.rawQuery("SELECT * FROM $tblTodo order by $colPriority ASC");
    return result;
  } 

  Future<int> getCount() async{
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
       await db.rawQuery("select count(*) from $tblTodo ") 
    ); 
    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = db.update(tblTodo, todo.toMap(),
    where: '$colId = ?',whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteTodo (int id) async {
    Database db = await this.db;
    var res = db.rawDelete("DELETE FROM $tblTodo where $colId = $id");
    return res;
  }

}
