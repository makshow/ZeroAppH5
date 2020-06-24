import 'package:flutter/material.dart';
import './pages/IndexPage.dart';
/** flutter 项目快捷键 
 *  flutter run运行项目  flutter run -d emulator-5554 
 *  shift+ R键 点击热加载 flutter run -d  E631C902-5A60-48D7-86D1-3EDF30568D51 
 *  P键 切换网格,查看布局使用
 *  O键 切换android和iOS的预览模式
 *  Q键 退出调试模式
 *  解决android模拟器无法链接网络
 *  cd /Users/smellzero/Library/Android/sdk/emulator
 *  ./emulator -avd Pixel_3_API_28 -dns-server 8.8.8.8,114.114.114.114
 *  flutter 项目创建  flutter create -i objc  flutteroc
 *  字母0切换iOS和android模式
 *   手动安装包  flutter packages get
 */



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

