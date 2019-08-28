import 'package:flutter/material.dart';
// import './screens/home.dart';
// import './screens/comments.dart';
//import './screens/prices.dart'; 
import './screens/orders.dart'; 

void main(){ 
 
  runApp(new MaterialApp(

    debugShowCheckedModeBanner: false,
    title:"PizzaSensei",
    home : new Orders(),
  ));
  
  }