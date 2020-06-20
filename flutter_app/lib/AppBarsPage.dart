import 'package:flutter/material.dart';

class AppBarsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Expanded(
                child: TabBar(
                  //isScrollable: true,//头部标签可以滚动
                  indicatorColor: Colors.orange,
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.label, //滚动条长度和文字一样大小
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.purple,
                  tabs: <Widget>[
                    Tab(
                      text: '热门',
                    ),
                    Tab(
                      text: '推荐',
                    ),
                    Tab(
                      text: '其他',
                    )
                  ],
                ))
              ],
            ),

            // bottom: TabBar(
            //   tabs: <Widget>[
            //     Tab(
            //       text: '热门',
            //     ),
            //     Tab(
            //       text: '推荐',
            //     ),
            //     Tab(
            //       text: '其他',
            //     )
            //   ],
            // ),
          ),
          body: TabBarView(
            //physics: NeverScrollableScrollPhysics(), //关闭手势滑动
            children: <Widget>[
              ListView(children: <Widget>[
                ListTile(
                  title: Text("a文本一"),
                ),
                ListTile(
                  title: Text("a文本二"),
                ),
                ListTile(
                  title: Text("a文本三"),
                )
              ]),
              ListView(children: <Widget>[
                ListTile(
                  title: Text("b文本一"),
                ),
                ListTile(
                  title: Text("b文本二"),
                ),
                ListTile(
                  title: Text("b文本三"),
                )
              ]),
              ListView(children: <Widget>[
                ListTile(
                  title: Text("c文本一"),
                ),
                ListTile(
                  title: Text("c文本二"),
                ),
                ListTile(
                  title: Text("c文本三"),
                )
              ]),
            ],
          ),
        ));
  }
}

// class AppBarsPage extends StatelessWidget {

//  final List<Tab> _myTabs = <Tab>[
// Tab(text: '选项一',icon: Icon(Icons.add_shopping_cart),),
// Tab(text: '选项二',icon: Icon(Icons.wifi_tethering),),
// Tab(text: '选项三',icon: Icon(Icons.airline_seat_flat_angled),)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: _myTabs.length, initialIndex: 1,child:Scaffold(
//       appBar: AppBar(
//         title: Text('AppBars'),
//         centerTitle: true, //标题居中显示

//         bottom: new TabBar(
//                   tabs: _myTabs,
// indicatorColor: Colors.orange,
// indicatorWeight: 5,
// indicatorSize: TabBarIndicatorSize.label,
// // labelColor: Colors.limeAccent,
//  labelColor: Colors.white,
// // unselectedLabelColor: Colors.deepOrange,
//  unselectedLabelColor: Colors.purple,
//                 ),

//       ),

//       body: new TabBarView(
//                   children: _myTabs.map((Tab tab){
//                     return Center(
//                         child: new Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             Icon(Icons.tab),
//                             Text(tab.text)
//                           ],
//                       ),
//                     );
//                   }).toList(),

//               ),

//     ));

//   }

// }
