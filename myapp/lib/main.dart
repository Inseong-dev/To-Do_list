import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mylist(),
    );
  }
}

class Mylist extends StatefulWidget{
  const Mylist({super.key});

  @override
  State<Mylist> createState() => _Mylist();
}

class ItemList{
  static List<String> todoList = []; 
}


class _Mylist extends State<Mylist>{
  TextEditingController inputController = TextEditingController();
  String inputText = "";
  void plusitemlist() async{
    await showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(
            "ADD TO-DO-LIST",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: inputController,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Confirm"),
              onPressed: (){
                inputController.text.replaceAll(" ","") == "" ?  () : Navigator.pop(context);
              },
            )
          ]
        ); 
      }
    );
    setState((){
       ItemList.todoList.add(inputController.text);
       inputController.clear();
    });
}
  @override
  void dispose(){
    inputController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    var now = new DateTime.now();
    String formatDate = DateFormat('yy/MM/dd').format(now);
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("ToDoList For me"),
              Text(formatDate),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: ItemList.todoList.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              background: Container(color: Colors.red,),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction){
                setState(() {
                  if(direction == DismissDirection.startToEnd){
                    ItemList.todoList.removeAt(index);
                  }
                });
              },
              child: TodoItemList(itemText: ItemList.todoList[index], index: index + 1, devicesize: MediaQuery.of(context).size),
              key: Key(ItemList.todoList[index]),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:plusitemlist,
          child: const Icon(Icons.add),
          ),
    );
  }
}


class TodoItemList extends StatefulWidget{
  final devicesize;
  final itemText;
  final index;
  
  TodoItemList({
    super.key,
    required this.itemText,
    required this.index,
    required this.devicesize,
  });

  @override
  State<TodoItemList> createState() => _TodoItemList();
}
class _TodoItemList extends State<TodoItemList>{
 
  bool activationFlag = true;
  Icon boxIcon = Icon(Icons.check_box_outline_blank);
  void activationFlagChange(){
    setState(() {
      activationFlag = !activationFlag;
      boxIcon = activationFlag? Icon(Icons.check_box_outline_blank) : Icon(Icons.check_box);
    });
  }
  void deleteData(){
    setState(() {
      ItemList.todoList .removeAt(widget.index - 1);
      
    });
  }
  @override
  Widget build(BuildContext context){
    return SizedBox(
    height: widget.devicesize.height * 0.1,
    child: Row(
      children: [
              Row(
                children: [
                  Text("${widget.index} : "),
                  Text(
                    widget.itemText, 
                    style: TextStyle(
                      decoration: activationFlag? TextDecoration.none : TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                  onPressed:activationFlagChange,
                  icon: boxIcon,
                  ),
                ],
              )
            ]
          )
        );
      }
    }


