
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true, //标题居中显示
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("下一步"),
                textColor: Theme.of(context).accentColor,
                highlightColor: Colors.red,
                // color: Colors.pink,
                onPressed: () {
                   Navigator.pushNamed(context, '/registerSecond');
                    //Navigator.of(context).pushReplacementNamed('/registerSecond');//路由替换
            
                }),
            RaisedButton(
                child: Text("返回上一级别"),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                    Navigator.of(context).pop();
                }),

          ],
        ),
      ),
    );
  }
}