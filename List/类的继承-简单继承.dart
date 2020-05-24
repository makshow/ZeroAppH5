/**面对对象的三大特性 封装 ,继承,多态
 * Dart中的类的继承
 * 1.子类使用extends关键词来继承父类 
 * 2.子类会继承父类里面的可见属性和方法,但不会继承构造函数
 * 3.子类能复写父类的方法 getter 和setter
 * 
 */

/**父类 */
class SuperClassPerson{
  //声明变量属性,默认值
  String name;
  int age ;
  
  SuperClassPerson(String name , int age){
     print("这是SuperClassPerson构造函数里面的内容 这个方法在初始化的触发");//实例化的时候动态设置属性
     this.name = name;
     this.age  = age;
  }

  void getInfo(){
      print("$name---$age");
      print("${this.name}----${this.age}");//推荐使用方法
  }

  void work(){

     print("${this.name}-在工作");//推荐使用方法
  }

}


/**子类 */
class  SubClass extends SuperClassPerson{
  String sex;
  SubClass(String name, int age ,String sex) : super(name, age){

      this.sex = sex;

  }

 show(){
    print("${this.name}----${this.age}-----${this.sex}");//推荐使用方法
    //子类中直接调用父类的方法
    super.work();
 } 

//重写父类的方法
  @override
  void getInfo(){
      print("重写父类的方法${this.name}");//推荐使用方法
  }

  
}


/**
 * Dart中抽象类:Dart抽象类主要用于定义标准,子类可以继承抽象类,也可以实现抽象类接口
 * 1.抽象类提供abstract 关键字定义
 * 2.Dart中抽象方法不能用abstract声明,Dart中没有的方法体的方法我们称为抽象方法
 * 3.如果子类继承抽象类必须实现里面的抽象方法
 * 4.如果把抽象类当做接口实现的话必须实现抽象类里面自定义的所以属性和方法
 * 5.抽象类不能被实例化,只有继承它的子类可以
 * 
 * extends抽象类和implements的区别
 * 1.如果要复用抽象类里面的方法,并且要用抽象方法约束自然类的化我们就要用*extends继承抽象类
 * 2.如果只把抽象类当做标准的化我们就要使用implements实现抽象类
 */


/**实现Animal类要求它的子类必须包含eat方法 */
abstract class Animal{
   eat();//抽象方法

   printInfo(){//非抽象方法
     print("我是抽象类里面的普通方法");
   }
}

class Dog extends Animal{
  /**子类必须实现父类的全部抽象方法 */
  @override
  eat() {
    print("小狗吃骨头");
  }

  wokr(){
     print("小狗在草坪玩耍");
  }

}

class Cat extends Animal{
  @override
  eat() {
    // TODO: 子类必须实现父类的全部抽象方法
   print("小毛吃老鼠的。。");
    
  }
  
}

/**
 * Dart中的多态:
 * 允许将子类类型的指针赋予父类类型的指针,同一个函数调用会有不同的执行效果
 * 子类的实例赋值给父类的引用
 * 多态就是父类定义一个方法不实现,让继承的子类去实现,每个子类会有不同的表现
 */



/**
 * 定义一个DB库接口,子类实现接口 MySql  MsSql
 */


abstract class DBsql{

   String uri;
   add(String data);
   save();
   delete();


}

abstract class DBOracle{

   String name;
   reque();
   edit();
   remove();



}



class MySql implements DBsql{

  @override
  String uri;

  //实现构造函数
   MySql(String uri){
     print("这是构造函数里面的内容 这个方法在初始化的触发");
     this.uri = uri;
     
  }


  @override
  add(String data) {
    print("这是MySql---add ${data}");
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  save() {
    // TODO: implement save
    throw UnimplementedError();
  }

  

}




class MsSql implements DBsql{

  @override
  String uri;

  MsSql(String uri){
     print("这是构造函数里面的内容 这个方法在初始化的触发${uri}");
     this.uri = uri;
     
  }

  @override
  add(String data ) {
     print("这是MsSql---add ${data}");
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  save() {
    // TODO: implement save
    throw UnimplementedError();
  }



}



/**-------------------一个类实现多个接口---------------------------------- */
  class DataBase implements DBsql,DBOracle{
  @override
  String name;

  @override
  String uri;

  @override
  add(String data) {
     print("这是一个类实现多个接口---add方法 ${data}");
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  edit() {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  remove() {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  reque() {
    // TODO: implement reque
    throw UnimplementedError();
  }

  @override
  save() {
     print("这是一个类实现多个接口---save方法");
  }
    

  }

/**-------------------minxins中文意思就是混入,就是在类中混入其他功能---------------------------------- */
/**
 * 在Dart中可以使用minxins实现类似多继承多功能:
 * 因为minxins使用的条件,随着Dart版本在一直变化,这里将的是Dart2.x中使用的minxins的条件
 * 1.作为minxins的类只能继承自Object,不能继承其他类
 * 2.作为minxins的类不能有构造函数
 * 3.一个类可以minxins多个minxins类
 * 4.minxins绝不是继承,也不是接口,而是一张全新的特性
 * 5.代码例子
 */

class A {

   String user;
   void pritInfoA(){
     print("这是一个A类实方法 $user");
   }
}

class B {
    void pritInfoB(){
     print("这是一个B类实方法");
   }
}

class Person {
    String name;
    Person(String name ){
     print("这是构造函数里面的内容 这个方法在初始化的触发");
     this.name = name;
    
    }
    printInfo(){
      print("这是Person类的printInfo方法 ${this.name}");
    }

}

class C  extends Person  with A,B {

  C(String name) : super(name);//相当于继承了A类和B类的方法和属性
  /**在A类和B类中有相同的方法,最后执行with最后一个类里面的方法*/
  /**在A类和B类以及Person类中有相同的方法,还是执行with最后一个类里面的方法*/

}


void main()  {

SubClass per  = new SubClass("罗毛毛",27,"女");
per.getInfo();
per.show();

//子类调用父类的抽象方法和子类的方法
Dog dog = new Dog();
dog.eat();
dog.printInfo();
dog.wokr();

//子类的实例赋值给父类的引用例子,只能使用继承父类的抽象方法,在子类中的实现
Animal dogs = new Dog();
dogs.eat();
// 无法使用子类声明的方法 dogs.wokr();


Animal cat = new Cat();
cat.eat();

//定义的抽象类接口实现
MsSql sql = new MsSql("192.168.1.72");
sql.add("MsSql数据库");


DataBase base  = new DataBase();
base.add(null);
base.save();


C class_c = new C("初始化Person类名称");
class_c.user = "我继承了A类的属性变量";
class_c.pritInfoA();
class_c.pritInfoB();
class_c.printInfo();


}

