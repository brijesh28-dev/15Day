import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget{
  @override
  _TodoScreenState createState()=>_TodoScreenState();
}


class _TodoScreenState extends State<TodoScreen>{
  List<Map<String,dynamic>> todos=[];
  TextEditingController controller = TextEditingController();

  void addTodo(){

      setState(() {
        todos.add({
          "text":controller.text,
          "status":false,
        });
      });
      controller.clear();

  }

  void deleteTodo(int index){
    setState(() {
      todos.removeAt(index);
    });
  }

  void toggleTodo(index){
    setState(() {
      todos[index]["status"] = !todos[index]["status"];
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text("Todo App"),
      ),
      body:Column(
        children: [
          Padding(
            padding:EdgeInsets.all(10),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller:controller,
                    decoration: InputDecoration(
                      hintText: "Enter task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(width:10),

                ElevatedButton(
                  onPressed: addTodo,
                  child:Text("Add"),
                )
              ],
            ),
          ),

          Expanded(
            child:ListView.builder(
              itemCount:todos.length,
              itemBuilder: (context,index){
                return ListTile(

                  leading:Checkbox(
                    value:todos[index]["status"],
                    onChanged:(value){
                      toggleTodo(index);
                    },
                  ),




                  title:Text(todos[index]["text"]),
                trailing:IconButton(
                  icon:Icon(Icons.delete_forever_rounded),
                  onPressed:()=>deleteTodo(index),
                ),
                );
              },
            ),
          ),


        ],
      )
    );
  }
}