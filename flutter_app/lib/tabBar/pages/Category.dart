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
                Navigator.pushNamed(context, '/search', arguments: {
                  "id": 123,
                });
              }),
          RaisedButton(
              child: Text("命名路由跳转传值到有状态页面"),
              textColor: Theme.of(context).accentColor,
              highlightColor: Colors.red,
              // color: Colors.pink,
              elevation: 10, //阴影熟悉
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder:(context)=>Search(title:"点击按钮跳转传值")
                //       ),
                print("命名路由跳转传值到有状态页面== 点击按钮跳转 ");
                // );
              }),

          /*各种按钮组件  
               1.使用Container设置宽带和高度固定RaisedButton 宽高
               2. Expanded设置自适应宽带的RaisedButton
               3. RaisedButton.icon(onPressed: null, icon: null, label: null) 图标按钮
              **/
          RaisedButton.icon(
            onPressed: () {
              print("RaisedButton== 图标按钮 ");
            },
            icon: Icon(Icons.access_time),
            label: Text("图标按钮"),
            color: Colors.orange,
          ),
          RaisedButton(
            child: Text("圆角按钮"),
            textColor: Theme.of(context).accentColor,
            // highlightColor: Colors.red,
            color: Colors.purple,
            onPressed: () {
              print("命名路由跳转传值到有状态页面== 点击按钮跳转 ");
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          RaisedButton(
            child: Text("圆形状按钮"),
            textColor: Theme.of(context).accentColor,
            color: Colors.yellow,
            onPressed: () {
              print("命名路由跳转传值到有状态页面== 点击按钮跳转 ");
            },
            shape: CircleBorder(
              side: BorderSide(color: Colors.red),
            ),
            splashColor: Colors.purple, //点击效果水波文
          ),
          FlatButton(
              onPressed: () {
                print("扁平化按钮 ");
              },
              child: Text("扁平化按钮"),
              color: Colors.yellow),
          OutlineButton(
            onPressed: () {
              print("带边框的按钮 ");
            },
            child: Text("带边框的按钮"),
            textColor: Colors.yellow,
            highlightedBorderColor: Colors.black,
          ),
          ButtonBar(
            children: <Widget>[
              //可以放多个按钮
              RaisedButton.icon(
                onPressed: () {
                  print("RaisedButton== 图标按钮 ");
                },
                icon: Icon(Icons.access_time),
                label: Text("图标按钮"),
                color: Colors.orange,
              ),

              RaisedButton(
                  child: Text("命名路由跳转无状态页面传值"),
                  textColor: Theme.of(context).accentColor,
                  highlightColor: Colors.red,
                  // color: Colors.pink,
                  onPressed: () {
                    print("RaisedButton== 点击按钮跳转 ");
                    Navigator.pushNamed(context, '/search', arguments: {
                      "id": 123,
                    });
                  }),
                  
            ],
          )
        ],
      ),
    );
  }
}
