import 'package:flutter/material.dart';

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
 * 
 *   手动安装包  flutter packages get
 */


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//关闭显示debug模式
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
     
        title: Text(widget.title),
      ),
      
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ]
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
