import 'package:flutter/material.dart';

class CityShop extends StatefulWidget {
  CityShop({Key key}) : super(key: key);

  @override
  _CityShopState createState() => _CityShopState();
}

class _CityShopState extends State<CityShop> {

  final p1 = Person.withName("why"); 
  final p2 = Person.withName("why");
   
  // 断言抛出错误assert(xxx);

  //构造函数执行(初始化)
  CityShop(){
      print("这是构造函数里面的内容 这个方法在初始化的触发");
      
      // print(identical(p1, p2)); 
        
  }


  @override
  void initState() {
    // TODO: 插入渲染树时调用，只调用一次
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: state依赖的对象发生变化时调用 
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: state依赖的对象发生变化时调用 构建Widget时调用
    return MaterialApp(
      debugShowCheckedModeBanner: false, //显示debug模式
      theme: ThemeData(
        primarySwatch: Colors.orange,//设置的主题颜色
      ),
      title: "我是新项目",
      home: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          centerTitle: true, //标题居中显示
        ),
        body:Center(
           child:Text('标题居中显示'),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: 当移除渲染树的时候调用
    super.deactivate();
    
  } 

  @override
  void dispose() {
    // TODO: 组件即将销毁时调用
    super.dispose();
  }



  
   
}
// TODO: 枚举(enum)的使用
/**
 *   print(Colorst.values); 
 *   print(Colorst.red.index); 
 *   数据安全系数,可读性强
 */
enum  Colorst {
   
  red,
  orange,
  green

}


// TODO: minxin混入的使用,不能使用class,使用with进行混入

mixin Run {
  void running(){

  }
}

mixin Flyer {
  void eating(){

  }
}

class SuperMan extends CityUser with Run,Flyer{
  SuperMan(String name) : super(name);

       
}



  class CityUser{

  String name;
  CityUser(this.name);

  // TODO: setter 调用
   set setName(String name){
     this.name = name;
   }
  
  // TODO: getter 调用
  String get getName {
     return this.name;
  } 

}

  // TODO: SunCityUser 类的继承
class SunCityUser extends CityUser{
  
   int age;
   SunCityUser(this.age, String name ):super(name);
   
}

// TODO: 隐私接口,默认情况下所有类都是隐式接口


  // TODO: 抽象类,抽象类不能实例化
abstract  class Shape{

  int getArea();
  String getInfo(){
    return "抽象类";
  }


  // factory Shape(){
  //   return null;
  // } 

}

//继承抽象类后,必须实现抽象类的抽象方法
class Reactangle extends Shape{

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
class User{

    final String name;
    final int age;

    static const  temp = 20;
    //User(this.name,{int age}):this.age =10{}

    //User(this.name,{int age}):this.age = temp??30{}
    User(this.name,{int age}):this.age = temp>20?30:50 {//三木运算符

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

       static final Map<String,Person>_nameCache = {};
       static final Map<String,Person>_colorCache = {};

       
       factory Person.withName(String name){

         if (_nameCache.containsKey(name)) {
             return _nameCache[name];
         } else {
            final person = Person(name, "default");
            return person;
         }
       } 
        
        factory Person.withColor(String color){

         if (_colorCache.containsKey(color)) {
             return _colorCache[color];
         } else {
            final person = Person( "default",color);
             return person;
         }
       }  

       Person(this.name,this.color);

}