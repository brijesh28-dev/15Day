import 'package:flutter/material.dart';

import 'frontend.dart';

class Auth extends StatefulWidget{
  @override
  _AuthState createState()=> _AuthState();

}

class _AuthState extends State<Auth>{
  void submit() {
    String user = emailController.text;
    String pass = passController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoScreen(user: user),
      ),
    );

    emailController.clear();
    passController.clear();
  }

  TextEditingController controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String user="";
  String pass="";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text("Login/SignUP"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child:Row(

            children: [
              Expanded(
                child: TextField(
                  controller:emailController,
                  decoration: InputDecoration(
                    hintText:"Enter your email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Expanded(
                child: TextField(
                  controller:passController,
                  decoration: InputDecoration(
                    hintText:"Enter your Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            ],
          ),
          ),
          ElevatedButton(
            onPressed: submit,
            child:Text("SUBMIT"),
          )
        ],
      ),
    );
  }
}