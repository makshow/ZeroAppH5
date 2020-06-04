
import 'package:flutter/material.dart';
import './pages/HomeScreen.dart';
import './pages/Category.dart';
import './pages/User.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  

  int _currentIndex = 0;
  List  pages = [
   HomeScreen(),
   Category(),
   User(),
   Category(),
  ];






  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // appBar: AppBar( title: Text('应用名称')),
        body: this.pages[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 32, 
          fixedColor: Colors.pink,//选择颜色
          type: BottomNavigationBarType.fixed,//超出3个显示设置
          items:[
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
                'Email',
              style: TextStyle( color:Colors.orange),
              )),
               BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                //color:Colors.orange,
              ),
              title: Text(
                'User',
               style: TextStyle( color:Colors.orange),
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

