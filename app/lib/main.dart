import 'package:flutter/material.dart';
import 'package:todo/backend.dart';
import 'package:todo/frontend.dart';
import 'package:todo/login.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Auth(),

    );
  }
}