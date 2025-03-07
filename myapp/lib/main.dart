
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

class _Mylist extends State<Mylist>{
  List<String> item1 = [];
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
              TextField(
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
       item1.add(inputController.text);
    });
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("ToDoList For me"),
              Text("2025.02.18"),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: item1.length,
          itemBuilder: (BuildContext context, int index){
            return  TodoItemList(itemText: item1[index], index: index + 1, devicesize: MediaQuery.of(context).size);
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
                  IconButton(
                  onPressed:() {},
                  icon: Icon(Icons.delete),
                  )
                ],
              )
            ]
          )
        );
      }
    }


