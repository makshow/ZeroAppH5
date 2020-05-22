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

void main()  {

SubClass per  = new SubClass("罗毛毛",27,"女");
per.getInfo();
per.show();





}