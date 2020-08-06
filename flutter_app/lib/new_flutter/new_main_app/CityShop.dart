import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CityShop extends StatefulWidget {
  CityShop() {
    print("生命周期第一步调用CityShop的constructor方法");
  }

  @override
  _CityShopState createState() {
    print("生命周期第二步调用CityShop的createState方法");
    return _CityShopState();
  }
}

class _CityShopState extends State<CityShop> {
  // 断言抛出错误assert(xxx);

  _CityShopState() {
    print("生命周期第三步调用CityShop的constructor方法");
  }

  @override
  void initState() {
    // TODO: 插入渲染树时调用，只调用一次
    super.initState();
    print("生命周期第四步调用initState方法");
  }

  final ImageUrl =
      "https://static.cjwsc.com//image/93/c8/ef/93c8ef23bc7e1139e54de66090ddd2b5.jpg";

  @override
  Widget build(BuildContext context) {
    // TODO: state依赖的对象发生变化时调用 构建Widget时调用
    print("生命周期第五步调用build方法");
    return MaterialApp(
      debugShowCheckedModeBanner: true, //显示debug模式
      theme: ThemeData(
        primarySwatch: Colors.orange, //设置的主题颜色
      ),
      title: "我是新项目",
      home: Scaffold(
          appBar: AppBar(
            title: Text('HOME'),
            centerTitle: true, //标题居中显示
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {},
            child: Icon(Icons.add),
          ),
          //设置 floatingActionButton的位置
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          body: Container(
            child: ListView(children: <Widget>[
              Column(
                children: <Widget>[
                  RichText(),
                  RaisedButton(
                      child: Text("点击按钮跳转传值"),
                      textColor: Theme.of(context).accentColor,
                      highlightColor: Colors.red,
                      // color: Colors.pink,
                      onPressed: () {
                        print("点击事件");
                      }),
                  FlatButton(
                    //1.默认情况下Button上下有48px的间距
                    onPressed: () {
                      print("FlatButton点击事件");
                    },
                    child: Text("FlatButton按钮"),
                    color: Colors.red,
                    //设置紧缩属性去掉上下间距
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  FlatButton(
                    //设置紧缩属性去掉上下间距 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.favorite, color: Colors.red),
                        Text("点赞喜欢")
                      ],
                    ),
                    color: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(6)
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                  OutlineButton(
                    onPressed: () {
                      print("OutlineButton点击事件");
                    },
                    child: Text("OutlineButton按钮"),
                  ),

                  //图片进行颜色设置混入
                  Image(
                    image: NetworkImage(ImageUrl),
                    color: Colors.pink,
                    colorBlendMode: BlendMode.colorDodge,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.repeatY,
                    alignment: Alignment(0, 0),
                  ),
                  //加载本地图片
                  Image(image: AssetImage('images/adorn_icon.png')),
                  // Image.asset('images/adorn_icon.png', width: 100,height: 100),
                  ButtonTheme(
                    //1.默认情况下Button有一定的间距
                    //2.Button变小设置
                    //3.取出Button的内边距
                    minWidth: 80,
                    height: 10,
                    child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          print("ButtonTheme--FlatButton点击事件");
                        },
                        color: Colors.red,
                        //设置紧缩属性去掉上下间距
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        textColor: Colors.white,
                        child: Text("FlatButton1")),
                  ),
                  //1.占位图
                  //2.图片缓冲flutter默认给加载已经存在的图片缓存,默认最多缓存1000张,内存最大100M
                  FadeInImage(
                    placeholder: AssetImage('images/adorn_icon.png'),
                    image: NetworkImage(
                        "https://static.cjwsc.com//image/6f/9c/4d/6f9c4d009ed7eb7c6332fb1b0904811d.jpg"),
                    fadeOutDuration: Duration(milliseconds: 5),
                    fadeInDuration: Duration(milliseconds: 5),
                  ),
                  //字体图标设置模式 text转换为unicode模式""\u去掉0x"
                  Icon(Icons.pets, size: 100, color: Colors.orange),
                  Text("\ue91d",
                      style: TextStyle(
                          fontSize: 100,
                          color: Colors.red,
                          fontFamily: "MaterialIcons")),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      maxLength: 30, //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                      maxLines: 1, //最大行数
                      autocorrect: true, //是否自动更正
                      autofocus: true, //是否自动对焦
                      obscureText: true, //是否是密码
                      textAlign: TextAlign.center, //文本对齐方式
                      style: TextStyle(
                          fontSize: 15.0, color: Colors.blue), //输入文本的样式
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ], //允许的输入格式
                      onChanged: (text) {
                        //内容改变的回调
                        print('change $text');
                      },
                      onSubmitted: (text) {
                        //内容提交(按回车)的回调
                        print('submit $text');
                      },
                      enabled: true, //是否禁用

                      decoration: InputDecoration(
                        labelText: "HSHSH",
                        icon: Icon(Icons.phone),
                        hintText: "请输入手机号",
                        border: OutlineInputBorder(),
                        //filled: true,
                        
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: state依赖的对象发生变化时调用
    super.didChangeDependencies();
    print("生命周期state依赖的对象发生变化时调用方法");
  }

  @override
  void didUpdateWidget(CityShop oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("生命周期更新组件变化时调用");
  }

  @override
  void deactivate() {
    // TODO: 当移除渲染树的时候调用
    super.deactivate();
    print("生命周期当移除渲染树的时候调用方法");
  }

  @override
  void dispose() {
    // TODO: 组件即将销毁时调用
    super.dispose();
    print("生命周期组件即将销毁时调用方法");
  }
}

class RichText extends StatelessWidget {
  const RichText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: "Hello Word",
          style: TextStyle(color: Colors.pink, fontSize: 20)),
      WidgetSpan(
          child: Icon(
        Icons.favorite,
        color: Colors.red,
        size: 21,
      )),
      TextSpan(
          text: "Hello Dart",
          style: TextStyle(color: Colors.blue, fontSize: 20)),
    ]));
  }
}

// TODO: Dart事件循环

// TODO: 枚举(enum)的使用
/**
 *   print(Colorst.values); 
 *   print(Colorst.red.index); 
 *   数据安全系数,可读性强
 */
enum Colorst { red, orange, green }

// TODO: minxin混入的使用,不能使用class,使用with进行混入

mixin Run {
  void running() {}
}

mixin Flyer {
  void eating() {}
}

class SuperMan extends CityUser with Run, Flyer {
  SuperMan(String name) : super(name);
}

class CityUser {
  String name;
  CityUser(this.name);

  // TODO: setter 调用
  set setName(String name) {
    this.name = name;
  }

  // TODO: getter 调用
  String get getName {
    return this.name;
  }
}

// TODO: SunCityUser 类的继承
class SunCityUser extends CityUser {
  int age;
  SunCityUser(this.age, String name) : super(name);
}

// TODO: 隐私接口,默认情况下所有类都是隐式接口

// TODO: 抽象类,抽象类不能实例化
abstract class Shape {
  int getArea();
  String getInfo() {
    return "抽象类";
  }

  // factory Shape(){
  //   return null;
  // }

}

//继承抽象类后,必须实现抽象类的抽象方法
class Reactangle extends Shape {
  @override
  int getArea() {
    // TODO: implement getArea
    throw 100;
  }

  @override
  String getInfo() {
    // TODO: implement getInfo
    return super.getInfo();
  }
}

// TODO: 初始化列表
class User {
  final String name;
  final int age;

  static const temp = 20;
  //User(this.name,{int age}):this.age =10{}

  //User(this.name,{int age}):this.age = temp??30{}
  User(this.name, {int age}) : this.age = temp > 20 ? 30 : 50 {
    //三木运算符
  }
}

// TODO: 工厂构造函数
/**
 * 1.普通的构造函数,会自动返回创建出来动对象,不能手动返回
 * 2.工厂构造函数最大特点,可以手动返回一个对象
 */
class Person {
  String name;
  String color;

  static final Map<String, Person> _nameCache = {};
  static final Map<String, Person> _colorCache = {};

  factory Person.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name];
    } else {
      final person = Person(name, "default");
      return person;
    }
  }

  factory Person.withColor(String color) {
    if (_colorCache.containsKey(color)) {
      return _colorCache[color];
    } else {
      final person = Person("default", color);
      return person;
    }
  }

  Person(this.name, this.color);
}
