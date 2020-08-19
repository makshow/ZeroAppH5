import 'package:flutter/material.dart';
import 'pages/index_page.dart';



void main() {
   
     runApp(MyApp());
}


class MyApp extends StatelessWidget {
  
  //06.Dio基础_Get请求和动态组件协作
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,//关闭显示debug模式
      //title: '百姓生活家+',
      
      theme: ThemeData(
        // primarySwatch: Colors.orange,  目前的主题颜色(primarySwatch)只有固定色值
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor:Colors.pink
      ),
      home: IndexPages(),

    );
  }


}

