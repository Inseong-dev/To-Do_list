import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Widget textSection1 = Text("hello1"); 
  Widget textSection2 = Text("hello2"); 
  Widget textSection3 = Text("hello3"); 
  Widget textSection4 = Text("hello4"); 
  List<Widget> item1 = [
                SizedBox(
              height: 200,
              width: 200,
              child: Text("a"),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Text("b"),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Text("c"),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Text("d"),
            ),
            
  ];
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
  List<Widget> item1 = [
                SizedBox(
              height: 200,
              width: 200,
              child: Text("a"),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Text("b"),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Text("c"),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Text("d"),
            ),
            
  ];

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
            
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(Icons.add),
          ),
    );
  }
}

