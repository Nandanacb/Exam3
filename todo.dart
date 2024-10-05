import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoExample extends StatefulWidget{
  const TodoExample({super.key});
State<TodoExample> createState()=> _TodoExampleState();

}

class _TodoExampleState extends State<TodoExample>{

  List<Map<String,dynamic>> _todoItems =[];

  List<color> _colorList=[
   
   Colors.green,
   Colors.yellow,
   Colors.purple,
   Colors.blue,
   Colors.red,

  ];
@override
  void initState(){
    super.initState();
    _loadTodoItems();
  }

  _loadTodoItems() async{
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();

       List<String>? tasks=prefs.getStringList('todoItems');
       List<String>? colors=prefs.getStringList('todoColors');

       if(tasks != null && colors != null){
        setState(() {
          _todoItems=List.generate(_todoItems.length, (index){
            return{
              'task':tasks[index],
              'color':colors[index],
            
          };
        });
            
          });
       }
    }catch (e){
      print('error loading todoItems:$e');
    }
}

_saveTodoItems() async {
  try{
  SharedPreferences prefs= await SharedPreferences.getInstance();

  _todoItems.map((item)=> item['task']as String).toList();
  _todoItems.map((item)=>item['color'];
  final color= color[index]as color;
  return color.value.toString();
  ).toList();
}


}


}


@override
      
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text('to do example'),),
  
  body: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),tooltip: 'Add Task',),);
 }  
  
