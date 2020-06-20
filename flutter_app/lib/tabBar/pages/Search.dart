import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  
  // String title  = "搜索";
  final  arguments;
  // Search({this.title = "搜索"});
   Search({this.arguments});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索页面${arguments!=null?arguments['id']:'0'}"),
        centerTitle: true, //标题居中显示
      ),
      body: Text('搜索页面'),
      floatingActionButton:FloatingActionButton(//凸起按钮
        child:Text('返回'),
        onPressed: (){
            Navigator.of(context).pop();
            print(this.arguments);
        }
        ) ,
    );
  }
}

