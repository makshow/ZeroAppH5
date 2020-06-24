import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import './HomePage.dart';
import './CatergoryPage.dart';
import './MemberPage.dart';
import './ShopCart.dart';


class IndexPages extends StatefulWidget {

  IndexPages({Key key  }) : super(key: key);

  @override
  _IndexPagesState createState() => _IndexPagesState();
  
}


class _IndexPagesState extends State<IndexPages> {
  
  int currentIndex = 0; 
  var currentPage;
 
  final List<BottomNavigationBarItem> bottom = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home), title: Text("首页")
      ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search), title: Text("分类")
      ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")
      ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心")
      ),
  ];

  final List <Widget>  pages = [
      HomePage(title: '百姓生活家+'),
      CatergoryPage(),
      ShopCart(),
      MemberPage()
  ];


  @override
  void initState() {
    super.initState();
    this.currentPage = pages[this.currentIndex];

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        fixedColor: Colors.pink,
        type: BottomNavigationBarType.fixed,
        items: this.bottom,
        currentIndex: this.currentIndex,
        onTap: (int index) {
          setState(() {
             this.currentIndex = index;
             this.currentPage = pages[this.currentIndex];
          });
        },
        ),

      body: this.currentPage,
    
    );
  }
}
