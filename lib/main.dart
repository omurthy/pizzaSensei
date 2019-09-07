import 'package:flutter/material.dart';
// import './screens/home.dart';
// import './screens/comments.dart';
//import './screens/prices.dart';
import './screens/orderList.dart';

void main()  =>
  runApp(new MyApp());  

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PizzaSensei",
      theme: new ThemeData(primarySwatch: Colors.deepOrange),
      home: new MyHomePage(title: "PizzaSensei Orders"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
      
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),

      ),
      body: OrderList(),
    );
  }
 

}
