import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";


class HomePage extends StatefulWidget {

  HomePage({Key key, this.title = "首页"}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
     
        title: Text(widget.title),
        centerTitle: true, //标题居中显示
      ),
      
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ]
        )
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ) 
    );
   }
   

}
