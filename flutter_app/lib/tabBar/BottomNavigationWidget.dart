import 'package:flutter/material.dart';
import './pages/HomeScreen.dart';
import './pages/Category.dart';
import './pages/User.dart';
import './pages/CarPage.dart';

class BottomNavigationWidget extends StatefulWidget {
  final index;

  BottomNavigationWidget({Key key, this.index = 0}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() =>
      _BottomNavigationWidgetState(this.index);
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex;
  List pages = [
    HomeScreen(),
    Category(),
    User(),
    CarPage(),
  ];

  _BottomNavigationWidgetState(index) {
    this._currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar( title: Text('应用名称')),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: () {
            print("FloatingActionButton点击按钮跳转 ");
              setState(() {
                _currentIndex = 1;
              });
          },
          child: Icon(Icons.add),
          backgroundColor: this._currentIndex == 1 ?Theme.of(context).accentColor:Color(0xc7c8c8),
        ),
        
        width: 80,
        height: 80,
        padding: EdgeInsets.all(8),
        //margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(40),
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this.pages[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        fixedColor: Colors.pink, //选择颜色
        type: BottomNavigationBarType.fixed, //超出3个显示设置
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                //color: Colors.orange,
              ),
              title: Text(
                'HOME',
                // style: TextStyle(color:Colors.orange),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                //color:Colors.orange,
              ),
              title: Text(
                '分类',
                style: TextStyle(color: Colors.orange),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                //color:Colors.orange,
              ),
              title: Text(
                'User',
                style: TextStyle(color: Colors.orange),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_shopping_cart,
                //color:Colors.orange,
              ),
              title: Text(
                'CarPage',
                style: TextStyle(color: Colors.orange),
              )),    
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
