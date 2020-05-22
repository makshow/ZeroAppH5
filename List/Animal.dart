/**自定义类  有object-c中的get和set方法*/
class Animal{
  //添加私有属性和方法
  String _name;
  int _age;
  
  //默认构造函数
  //进行简化写法 Animal(this._name,this._age);
  
   Animal():_name = "钱多多",_age = 12{
     print("默认初始化赋值调用");
   }



  void getInfo(){
      print("$_name---$_age");
      print("${this._name}----${this._age}");//推荐使用方法
  }

  void setInfoAge(int age){
    this._age = age;
    print("${this._age}");//推荐使用方法
  }



String getUsername(){
   return this._name;
}

void _run(){
  print("这是一个私有方法");
}


execRun(){//向外暴露的接口方法
   this._run();
}

get userAge{//向外暴露属性
  return this._age;
}

set animalsAage(int age){
   this._age = age;
   print("获取最新的年纪:${this._age}");
 }


 /**
  * 1.Dart中的静态成员 static 关键字实现静态属性和静态方法或者函数 类似与oc中的加方法
  * 2.静态方法不能非静态的成员变量,非静态方法可以访问静态成员变量 
  */
 static String title = "太阳";
 int  height = 168;
 static void show(String method){
    
    print("当前show静态方法名称:${method}");
    print("获取当前使用静态变量:${title}");//只能访问静态的属性和方法
 }
 void printInfo(){/**非静态方法 可以使用全部的声明变量 和方法 */
      print("获取当前使用静态变量:${title}");
      print("获取当前使用非静态变量:${this.height}");
      show("内部非静态方法调用静态方法"); 

      
 }

static void printInfoShow(){
   
    print("获取当前使用静态变量:${title}");//只能访问静态的属性和方法
    show("内部静态方法调用静态方法"); 
 }


}


/**Dart中的对象操作符号
 * ? 条件运算符
 * as 类型转换 进行类型的强制转换  (p as Person).属性和方法
 * is 类型判断 判断是否属于某个类 类似与 oc中的iskandOfClass 方法 返回一个bool值
 * .. 连缀操作
*/
