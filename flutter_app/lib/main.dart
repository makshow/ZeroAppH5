import 'package:flutter/material.dart';

/** flutter 项目快捷键
 *  flutter run运行项目  flutter run -d emulator-5554
 *  shift+ R键 点击热加载
 *  P键 切换网格,查看布局使用
 *  O键 切换android和iOS的预览模式
 *  Q键 退出调试模式
 *  解决android模拟器无法链接网络
 *  cd /Users/smellzero/Library/Android/sdk/emulator
 *  ./emulator -avd Pixel_3_API_28 -dns-server 8.8.8.8,114.114.114.114

 */
void main() {
  runApp(new CityShopApp());
}

//自定义组件
/**
 *  StatelessWidget 是无状态组件,状态不可变的widget(StatelessWidget是一个抽象类,有抽象方法)
 *  StatefulWidget  是有状态组件,持有的状态可能在widget生命周期改变
  
  MaterialApp({
  Key key,
  this.title = '', // 设备用于为用户识别应用程序的单行描述
  this.home, // 应用程序默认路由的小部件,用来定义当前应用打开的时候，所显示的界面
  this.color, // 在操作系统界面中应用程序使用的主色。
  this.theme, // 应用程序小部件使用的颜色。
  this.routes = const <String, WidgetBuilder>{}, // 应用程序的顶级路由表
  this.navigatorKey, // 在构建导航器时使用的键。
  this.initialRoute, // 如果构建了导航器，则显示的第一个路由的名称
  this.onGenerateRoute, // 应用程序导航到指定路由时使用的路由生成器回调
  this.onUnknownRoute, // 当 onGenerateRoute 无法生成路由(initialRoute除外)时调用
  this.navigatorObservers = const <NavigatorObserver>[], // 为该应用程序创建的导航器的观察者列表
  this.builder, // 用于在导航器上面插入小部件，但在由WidgetsApp小部件创建的其他小部件下面插入小部件，或用于完全替换导航器
  this.onGenerateTitle, // 如果非空，则调用此回调函数来生成应用程序的标题字符串，否则使用标题。
  this.locale, // 此应用程序本地化小部件的初始区域设置基于此值。
  this.localizationsDelegates, // 这个应用程序本地化小部件的委托。
  this.localeListResolutionCallback, // 这个回调负责在应用程序启动时以及用户更改设备的区域设置时选择应用程序的区域设置。
  this.localeResolutionCallback, // 
  this.supportedLocales = const <Locale>[Locale('en', 'US')], // 此应用程序已本地化的地区列表 
  this.debugShowMaterialGrid = false, // 打开绘制基线网格材质应用程序的网格纸覆盖
  this.showPerformanceOverlay = false, // 打开性能叠加
  this.checkerboardRasterCacheImages = false, // 打开栅格缓存图像的棋盘格
  this.checkerboardOffscreenLayers = false, // 打开渲染到屏幕外位图的图层的棋盘格
  this.showSemanticsDebugger = false, // 打开显示框架报告的可访问性信息的覆盖
  this.debugShowCheckedModeBanner = true, // 在选中模式下打开一个小的“DEBUG”横幅，表示应用程序处于选中模式
})


class Scaffold extends StatefulWidget {
 Creates a visual scaffold for material design widgets.
  const Scaffold({
    Key key,
    this.appBar, //横向水平布局，通常显示在顶部（*）
    this.body, // 内容（*）
    this.floatingActionButton, //悬浮按钮，就是上图右下角按钮（*）
    this.floatingActionButtonLocation, //悬浮按钮位置
    //悬浮按钮在[floatingActionButtonLocation]出现/消失动画
    this.floatingActionButtonAnimator, 
    //在底部呈现一组button，显示于[bottomNavigationBar]之上，[body]之下
    this.persistentFooterButtons,
    //一个垂直面板，显示于左侧，初始处于隐藏状态（*）
    this.drawer,
    this.endDrawer,
    //出现于底部的一系列水平按钮（*）
    this.bottomNavigationBar,
    //底部持久化提示框
    this.bottomSheet,
    //内容背景颜色
    this.backgroundColor,
    //弃用，使用[resizeToAvoidBottomInset]
    this.resizeToAvoidBottomPadding,
    //重新计算布局空间大小
    this.resizeToAvoidBottomInset,
    //是否显示到底部，默认为true将显示到顶部状态栏
    this.primary = true,
    //
    this.drawerDragStartBehavior = DragStartBehavior.down,
  }) : assert(primary != null),
       assert(drawerDragStartBehavior != null),
       super(key: key);


 */

/**
 *  Container组件介绍
 * Container在Flutter中太常见了。官方给出的简介，是一个结合了绘制（painting）
   、定位（positioning）以及尺寸（sizing）widget的widget
   Container({
    Key key,
    this.alignment,
    this.padding,
    Color color,
    Decoration decoration,
    this.foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    this.margin,
    this.transform,
    this.child,
  })
 * 
 */

/**
 * 
  Text组件介绍
Text("Hello"), //普通文本
Text(
  "Large Hello.", //大号文本
  style: TextStyle(
    fontSize: 20
  ),
),
Text(
  "WonderfulHello;" * 10, //内容重复十遍
  textScaleFactor: 1, //代表文本相对于当前字体大小的缩放因子
  textAlign: TextAlign.start, //对齐方式
  maxLines: 2, //最大行数
  overflow: TextOverflow.ellipsis, //将多余文本截断后以省略符“...”表示
  style: TextStyle( //字体样式
      color: Colors.blue,  //字体颜色
      fontSize: 24,  //字体大小
      decoration: TextDecoration.underline,  //文字划线，上划线、下划线或删除线
      decorationStyle: TextDecorationStyle.wavy, //划线样式
      backgroundColor: Colors.black), //组件背景色
)
 */

class CityShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            //导航栏
            title: Text('应用名称')),
        body: HomePageGridView(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}


/** GridView组件*/
class HomePageGridView extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return GridView.count(
      
      crossAxisCount: 4,//控制显示几列
      children: <Widget>[
        const Text('I\'m dedicating every day to you'),
        const Text('Domestic life was never quite my style'),
        const Text('When you smile, you knock me out, I fall apart'),
        const Text('And I thought I was so smart'),
        
      ],
  );
}
}

/** ListView组件*/
class HomePageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      //scrollDirection: Axis.vertical, //设置方向 横向Axis.horizontal  垂直Axis.vertical
      children: <Widget>[
        Image.network(
          "http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png",
          width: 100,
          height: 100,
        ),
        Container(
          child: Text(
            '我是标题1',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.red,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          height: 60,
          padding: const EdgeInsets.all(10.0),
        ),
        Image.network(
            "http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png"),
        Image.network(
            "http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png"),
        Image.network(
            "http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png"),
      ],
    );
  }
}

/** ListView组件和水平列表组件,图标组件*/
class HomePageListViewListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        const Text('I\'m dedicating every day to you'),
        const Text('Domestic life was never quite my style'),
        const Text('When you smile, you knock me out, I fall apart'),
        const Text('And I thought I was so smart'),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.orange,
            size: 35,
          ),
          title: Text('I\'m dedicating every day to you',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.orange,
              )),
          subtitle: Text('Domestic life was never quite my style'),
          trailing: Icon(
            Icons.settings_backup_restore,
            color: Colors.red,
            size: 35,
          ),
        ),
        ListTile(
          leading: Image.network(
              "http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png"),
          title: Text('I\'When you smile, you knock me out, I fall apart',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              )),
          subtitle: Text('And I thought I was so smart'),
          trailing: Image.network(
              "http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png"),
        )
      ],
    );
  }
}

/** Image组件和Text组件*/
class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      /**
         Image.network( String src, {//通过网络资源创建
         Image.file(File file, { //通过文件创建
         Image.asset(String name, //通过资源文件创建
         Image.memory(Uint8List bytes, //通过内存创建
          
      
 
       //加载图片的方式一
       child: Image.network(
         "http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png",
         alignment:Alignment.bottomRight ,
         color: Colors.red,
         colorBlendMode: BlendMode.screen, 
         fit:BoxFit.fill ,//控制图片的拉升和缩放属性
         // 平铺效果repeat: ,
         ), 
        */
      /*
          image:DecorationImage(
            fit:BoxFit.fill ,
            image: NetworkImage('http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png')
            )
        */
      //直接加载圆角图片
      // child: ClipOval(
      //   child: Image.network(
      //  "http://47.107.113.21:8080/common_tj/start_page/test/../comm_mx.png",
      //  fit:BoxFit.fill ,//控制图片的拉升和缩放属性
      //  height: 100,
      //  width: 100,
      //  ),
      // ),

      child: Image.asset(
        'images/adorn_icon.png',
        width: 100,
        height: 100,
      ),

      /*
      child:Text( //文本属性
            "你好flutter现在改变哈哈我阿松频道啊",
            textDirection:TextDirection.ltr,
            style: TextStyle(
                fontSize: 10.0,
                color: Colors.red,
                backgroundColor:Color.fromARGB(234, 233, 181, 1),
                fontWeight:FontWeight.w300,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,//下划线
                decorationColor: Colors.green,//下划线颜色
                decorationStyle: TextDecorationStyle.double,//下划线风格double 2跟线
                wordSpacing: 10,//单词间距
                letterSpacing: 20,//文字间距
            ),
            textScaleFactor: 1.5,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis, //将多余文本截断后以省略符“...”表示
            maxLines: 3,//最大行数
       ),
       */

      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(
          color: Colors.blue,
          width: 2.0,
        ),
        /* borderRadius: BorderRadius.all( Radius.circular(10)),*/
        //加载图片的方式二
        borderRadius: BorderRadius.circular(20),
      ),

      padding: EdgeInsets.all(10),
      // 设置内边距四个方向的数据padding:EdgeInsets.fromLTRB(left, top, right, bottom)
      //设置外边距 margin: EdgeInsets.fromLTRB(left, top, right, bottom),
      //transform:Matrix4.translationValues(10, 30, 0) ,
      alignment: Alignment.bottomLeft, //在Container中内容显示的位置
    ));
  }
}
