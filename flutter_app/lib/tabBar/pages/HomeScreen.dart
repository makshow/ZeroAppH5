import 'package:flutter/material.dart';
import 'Search.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true, //标题居中显示
      ),
      body: HomePageApp(),
    );
  }
}

class HomePageApp extends StatefulWidget {
  HomePageApp({Key key}) : super(key: key);

  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("点击按钮跳转"),
              textColor: Theme.of(context).accentColor,
              highlightColor: Colors.red,
             // color: Colors.pink,
              onPressed: () {
                print("RaisedButton== 点击按钮跳转 ");
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:(context)=>Search()
                      ),
                 
                );

              }),
          RaisedButton(
              child: Text("点击按钮跳转传值"),
              textColor: Theme.of(context).accentColor,
              highlightColor: Colors.red,
             // color: Colors.pink,
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder:(context)=>Search(title:"点击按钮跳转传值")
                //       ),
                 
                // );
              })
        ],
      ),
    );
  }
}
