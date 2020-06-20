import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  CarPage({Key key}) : super(key: key);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TexField文本组件'),
          centerTitle: true, //标题居中显示
        ),
        body: Container(
            child: Column(children: <Widget>[
          RadioListTile(
              secondary: Icon(Icons.ac_unit),
              subtitle: Text("CheckboxListTi----"),
              title: Text("CheckboxListTile"),
              value: 1,
              groupValue: 1,
              onChanged: (value) => {print(value)}),
        ])));
  }
}
