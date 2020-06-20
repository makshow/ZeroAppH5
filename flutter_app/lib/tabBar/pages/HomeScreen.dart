import 'package:flutter/material.dart';
import 'Search.dart';
import 'package:date_format/date_format.dart';

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
      //设置左右侧边栏
      drawer: Drawer(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: DrawerHeader(
              child: Text("左侧边栏"),
              decoration: BoxDecoration(
                color: Colors.orange,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://static.cjwsc.com//image/93/c8/ef/93c8ef23bc7e1139e54de66090ddd2b5.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ],
        ),

        ListTile(
          title: Text("我是文字标题"),
          onTap: () {
            print("点击跳转");
          },
        ),
        Divider(), //线条组件
        ListTile(title: Text("我是文字标题")),
        Divider(), //线条组件
      ])),
      endDrawer: Drawer(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: UserAccountsDrawerHeader(
              accountName: Text("我是罗毛毛"),
              accountEmail: Text("2966497308@qq.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://static.cjwsc.com//image/93/c8/ef/93c8ef23bc7e1139e54de66090ddd2b5.jpg"),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            )),
          ],
        ),

        ListTile(title: Text("我是文字标题")),
        Divider(), //线条组件
        ListTile(title: Text("我是文字标题")),
        Divider(), //线条组件
      ])),
    );
  }
}

class HomePageApp extends StatefulWidget {
  HomePageApp({Key key}) : super(key: key);

  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {

  // String crunttDate = "2020-6-20";

  bool flag = true;
  DateTime _nowDate = DateTime.now();

  _showTimerPicker(){
     showTimePicker(
       context: context, 
       initialTime: TimeOfDay(hour: 12, minute: 40))//初始化时间
       .then((result) => {
             print("RaisedButton== 点击按钮跳转 ${result.format(context)}")
       });
  }

  _showDatePicker() async {

    // showDatePicker(
    //   context: context,
    //   initialDate: _nowDate,
    //   firstDate: DateTime(1980), // 减 30 天
    //   lastDate: DateTime(2100), // 加 30 天
    // ).then((DateTime val) {
    //   print(val); // 2020-02-24 00:00:00.000
    //   setState(() {
    //     // 需更新的参数
    //   });
    // }).catchError((err) {
    //   print(err);
    // });
    


     var result =  await  showDatePicker(
      context: context,
      initialDate: _nowDate,
      firstDate: DateTime(1980), // 减 30 天
      lastDate: DateTime(2100), // 加 30 天
    );

 


       setState(() {
          this._nowDate =  result;
      });
   print("RaisedButton== 点击按钮跳转 $result");

  }

  // DateTime _dateTime=DateTime.now();
  // String _showDatePicker(int selectIndex) {
  //   showDatePicker(
  //     context: context,
  //     initialDate: new DateTime.now(),
  //     firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
  //     lastDate: new DateTime.now().add(new Duration(days: 30)),       // 加 30 天
  //   ).then((DateTime val) {
  //     print(val);   // 2020-02-24 00:00:00.000
  //     setState(() {
  // 	// 需更新的参数
  //     });
  //   }).catchError((err) {
  //     print(err);
  //   });

  //获取当前日期  var now = DateTime.now();

  @override
  void initState() {
    super.initState();
    // print("获取当前日期$now");
    // print(now.millisecondsSinceEpoch); //时间戳 1592643603303
    // print(DateTime.fromMillisecondsSinceEpoch(1592643603303)); //时间戳转为时间

    // print(formatDate(DateTime.now(), [yyyy, '年', mm, '月', dd, '日']));
    // print(formatDate(DateTime(1989, 2, 21), [yy, '-', m, '-', dd]));
    // print(formatDate(DateTime(1989, 2, 1), [yy, '-', m, '-', d]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text("点击按钮跳转"),
              textColor: Theme.of(context).accentColor,
              highlightColor: Colors.red,
              // color: Colors.pink,
              onPressed: () {
                print("RaisedButton== 点击按钮跳转 ");
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Search()),
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
              }),
          Switch(
              value: this.flag,
              onChanged: (value) => {
                    setState(() {
                      this.flag = value;
                      print(value);
                    })
                  }),
          InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${formatDate(_nowDate, [yyyy, '年', mm, '月', dd, '日'])}"),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePicker),

         InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("18.08"),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showTimerPicker),     
        ],
      ),
    );
  }
}
