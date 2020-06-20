import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true, //标题居中显示
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).pop("返回成功");
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                 print("右边的按钮");
              }),
              IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                 print("右边的按钮设置");
              }),

        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("返回上一级别"),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).pop("登录成功");
                }),
          ],
        ),
      ),
    );
  }
}
