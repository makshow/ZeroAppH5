import './Person.dart';
import './Animal.dart';
void main()  {
 //数组操作的基础操作

List mylist = ['苹果', '橙子'];

mylist.forEach((element) {
  //print("------"+element);
});
mylist.forEach((element) =>{
  //print("element="+element)
});

mylist.forEach((element)=>print("elementx="+element));

// var array = mylist.map((e)  {
//     print(e);
//     return e+1;
// });
// print(array);

/**
List 里面常用属性和方法说明
常用属性
length   长度
reversed 翻转 倒序排序
isEmpty  是否为空
isNotEmpty 是否不为空

mylist.add(value)  增加
mylist.addAll(iterable) 拼接数组
mylist.indexOf(element) 查找 传入的具体数值
mylist.remove(value) 删除传入的具体数值
mylist.removeAt(index) 删除 传入的下标
mylist.fillRange(start, end) 修改
mylist.insert(index, element) 指定位置插入
mylist.insertAll(index, iterable) 指定位置插入List
mylist.toList() 其他数据类型转化为List
mylist.join()   List类型转化为字符串类型
mylist.split()  字符串转化为List
mylist.forEach((element) { //快速便利
  
})
mylist.map((e) => null)
mylist.where((element) => false) 
mylist.any((element) => false) 查找数组中属否含有特定值
mylist.every((element) => false)
 */


//集合类型 Set 去掉重复数据 {苹果, 橙子}
var dic = new Set();
dic.add('苹果');
dic.add('橙子');
dic.add('橙子');
print(dic);
print(dic.toList());

//字典类型或者说对象类型
/**
 映射Maps是无序的键值对: 
常用属性
person.keys; 获取所以key值
person.values;获取所以values值
person.isEmpty;
person.isNotEmpty;
常用方法
person.remove(key) 删除指定key
person.addAll({...}) 合并映射 给映射增加属性
person.containsValue(value) 查看映射内的值 返回true/false
person.containsKey(key)
person.forEach((key, value) { })
person.map((key, value) => null)
person.where 
any
every
 */
Map person = {
   "name":"钱多多",
   "age":"18",

} ;

print(person);

/**闭包
 * 1.全局变量的特点 全局变量常驻内存,全局变量污染全局
 * 2.局部变量的特点 不常驻内存会被垃圾回收机制回收,不会污染全局
 * 3.闭包的写法 函数嵌套函数,并return 里面的函数,形成闭包
 */

//闭包函数 不会污染全局,驻内存
getNumber() {
  var a = 123;
  return(){
   a++;
   print(a);
  };
}

var conunt = getNumber();
conunt();
conunt();
conunt();


/**Dart中的对象 类 类的创建 构造函数 命名构造函数 类模块化 私有属性 私有方法 get set */

Person per  = new Person("罗毛毛",27);
print(per.timer);
per.getInfo();
per.setInfoAge(30);
print("-------连缀写法----------");
per..name = "连缀-罗小猫"
   ..age  = 25
   ..getInfo(); 
print("-------连缀写法----------");

//命名构造函数调用
Person now = new Person.now();
print(now.name);

Person info = new Person.setInfo("赵晓倩", 25);
print(info.name);


// Animal animals = new Animal("小狗", 3);
Animal animals = new Animal ();
print("获取信息:${animals.getUsername()}");
print("获取年纪信息:${animals.userAge}");
animals.animalsAage = 10;
animals.printInfo();


Animal.show("外部调用静态方法");
print("获取当前Animal信息:${Animal.title}");





}


