import 'package:flutter/material.dart';

//有状态组件传值
class User extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserState();
}

class UserState extends State<User> {
  final defaultText = new TextEditingController(); //设置初始化默认值

  @override
  void initState() {
    super.initState();
    defaultText.text = "设置初始化默认值";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TexField文本组件'),
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
                  Navigator.pushNamed(context, '/product', arguments: {
                    "id": "User命名路由跳转有状态页面传值----",
                  });
                }),
            RaisedButton(
                child: Text("User跳转登录页面"),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/login').then((value) {
                    print("User跳转登录页面成功返回R" + value);
                  });
                }),
            RaisedButton(
                child: Text("User跳转注册页面传值"),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                }),
            TextField(
              // maxLines: 4,
              controller: defaultText,
              decoration: InputDecoration(
                icon: Icon(Icons.ac_unit),
                hintText: "请输入内容",
                //border: OutlineInputBorder()
              ),
            ),
            TextField(
              obscureText: true,
              onChanged: (value) => {print(value)},
              onSubmitted: (value) => {print("点击确认$value")},
              decoration: InputDecoration(
                  hintText: "密码输入框",
                  labelText: "密码",
                  border: OutlineInputBorder()),
            ),
            Checkbox(
                value: true,
                activeColor: Colors.orange,
                checkColor: Colors.red,
                onChanged: (value) => {print(value)}),
            CheckboxListTile(
                selected: true,
                value: true,
                secondary: Icon(Icons.ac_unit),
                title: Text("CheckboxListTile"),
                subtitle: Text("CheckboxListTi----"),
                activeColor: Colors.red,
                checkColor: Colors.orange,
                onChanged: (value) => {print(value)}),
            Radio(
                value: 1, groupValue: 1, onChanged: (value) => {print(value)}),
            Radio(
                value: 2, groupValue: 1, onChanged: (value) => {print(value)}),

            RadioListTile( selected: true, subtitle: Text("CheckboxListTi----"),title: Text("CheckboxListTile"),value: 1, groupValue: 1, onChanged: (value) => {print(value)}),
            

          ],
        ),
      ),
    );
  }
}
