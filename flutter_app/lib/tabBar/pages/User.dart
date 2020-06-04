import 'package:flutter/material.dart';

//有状态组件传值
class User extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserState();
}

class UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        centerTitle: true, //标题居中显示
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("User命名路由跳转有状态页面传值"),
                textColor: Theme.of(context).accentColor,
                highlightColor: Colors.red,
                // color: Colors.pink,
                onPressed: () {
                  print("RaisedButton== 点击按钮跳转 ");
                  Navigator.pushNamed(context, '/product',arguments: {
                      "id":"User命名路由跳转有状态页面传值----",
                  });
                }),
            

          ],
        ),
      ),
    );
  }
}
