import 'package:flutter/material.dart';
import '../pages/User.dart';
import '../BottomNavigationWidget.dart';

class RegisterSecond extends StatefulWidget {
  RegisterSecond({Key key}) : super(key: key);

  @override
  _RegisterSecondState createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册完成'),
        centerTitle: true, //标题居中显示
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("注册完成"),
                textColor: Theme.of(context).accentColor,
                highlightColor: Colors.red,
                // color: Colors.pink,
                onPressed: () {
                  print("注册完成");
                  // Navigator.of(context).pushReplacementNamed(routeName)
                  //返回指定目录
                  /*
                  Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new User();
                    }, ), (route) => route == null);
                  */
                  //返回根目录
                   Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new BottomNavigationWidget(index: 2,),
                   ), (route) => route == null);

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
