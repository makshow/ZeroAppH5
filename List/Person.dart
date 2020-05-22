/**自定义类 */
class Person{
  //添加属性和方法
  String name = "张三";
  int age = 23;
  var timer = new DateTime.now();

  void getInfo(){
      print("$name---$age");
      print("${this.name}----${this.age}");//推荐使用方法
  }

  void setInfoAge(int age){
    this.age = age;
    print("${this.age}");//推荐使用方法
  }

 //默认构造函数
//进行简化写法 Person(this.name,this.age);
  Person(String name , int age){
     print("这是构造函数里面的内容 这个方法在初始化的触发");//实例化的时候动态设置属性
     this.name = name;
     this.age  = age;
  }

 Person.now(){
   print("----------这是命名构造函数-------");
 }

 Person.setInfo(String name , int age){
     print("这是命名构造函数初始化的触发,给予默认值");//实例化的时候动态设置属性
     this.name = name;
     this.age  = age;
     print("${this.name}----${this.age}");//推荐使用方法
 }


   
}