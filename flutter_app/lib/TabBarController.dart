import 'package:flutter/material.dart';

class TabBarController extends StatefulWidget {
  TabBarController({Key key}) : super(key: key);

  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void dispose(){
    //生命周期组件销毁
     super.dispose();
     _tabController.dispose();
  }

  @override
  void initState() {
    //生命周期组件初始化
    super.initState();
    this._tabController = new TabController(vsync: this, length: 8);
    this._tabController.addListener(() {
      // print(this._tabController.toString());
      print("index${this._tabController.index}");
      print("length${this._tabController.length}");
      print("previousIndex${this._tabController.previousIndex}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.black,
          title: TabBar(
            controller: this._tabController,
            isScrollable: true, //头部标签可以滚动
            indicatorColor: Colors.orange,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.label, //滚动条长度和文字一样大小
            labelColor: Colors.white,
            unselectedLabelColor: Colors.purple,
            tabs: <Widget>[
              Tab(text: '女装'),
              Tab(text: '男装'),
              Tab(text: '童装'),
              Tab(text: '夏装'),
              Tab(text: '冬装'),
              Tab(text: '冬装1'),
              Tab(text: '冬装2'),
              Tab(text: '冬装3'),
            ],
          ),
        ),
        body: TabBarView(
          controller: this._tabController,
          children: <Widget>[
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
          ],
        ));
  }
}

class ListViewContnet extends StatelessWidget {
  const ListViewContnet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text("我是文字标题")),
        Divider(),//线条组件
        ListTile(title: Text("我是文字标题")),
        ListTile(title: Text("我是文字标题")),
        ListTile(title: Text("我是文字标题")),
        ListTile(title: Text("我是文字标题")),
        ListTile(title: Text("我是文字标题")),
        ListTile(title: Text("我是文字标题")),
        ListTile(title: Text("我是文字标题")),
      ],
    );
  }
}
