import 'package:flutter/material.dart';
// import './ui/home.dart';
// import './ui/comments.dart';
import './ui/prices.dart';
void main(){ 
  runApp(new MaterialApp(
    
    debugShowCheckedModeBanner: false,
    title:"PizzaSensei",
    home : new Prices(),
  ));
  
  }