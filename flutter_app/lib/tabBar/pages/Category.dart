import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CategoryState();
}

class CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('命名路由跳转'),
        centerTitle: true, //标题居中显示
      ),
      body: CategoryPage(),
    );
  }
}

class CategoryPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("命名路由跳转无状态页面传值"),
              textColor: Theme.of(context).accentColor,
              highlightColor: Colors.red,
             // color: Colors.pink,
              onPressed: () {
                print("RaisedButton== 点击按钮跳转 ");
                Navigator.pushNamed(context, '/search',arguments: {
                    "id":123,
                });

              }),
          RaisedButton(
              child: Text("命名路由跳转传值到有状态页面"),
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

