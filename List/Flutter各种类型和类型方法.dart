//泛型  泛型方法 泛型类 泛型接口
/**
 * 1.泛型 就是解决 类 接口 方法的复用性,以及对不特定的数据类型的支持(类型校验)
 * Dart中集合的类型是具体的，也就是说你通过泛型约束集合后，就是对应的类型。
  
 */
//泛型函数,传入什么类型,返回什么类型
The getDate<The>(The value){
   return value;
}

abstract class Cache<The> {
    getByKey(String key);
    void setByKey(String key,The value);
}

class FlieCache<The> implements Cache<The>{
  @override
  getByKey(String key) {
      throw null;
    }
  
    @override
    void setByKey(String key, The value) {
      print("我是文件缓存---key=${key},----value=${value}");
  }
  

}


class MemoryCache<The> implements Cache<The> {
  @override
  getByKey(String key) {
      throw UnimplementedError();
    }
  
    @override
    void setByKey(String key, The value) {
     print("我是内存缓存---key=${key},----value=${value}");
  }
  
}


class PersonClass<The> {
   List list = new List<The>();
  
   void add(The value){
      this.list.add(value);
   }

   void printInfo(){
 
     this.list.forEach((element) {
        print(element);
     });

   var array =  this.list.map((element)   {
         print("map快速遍历,$element");
         return element;
     }); 

     print(array.toList());
   }
  
   
}

void main() {
  
  String name = getDate("获取当前时间");
  print(name); // true  

  //泛型类
  var names = new List<String>();
  names.addAll(['Seth', 'Kathy', 'Lars']);
  if (names is List<String>) {
    print(names); // true
  }

  //泛型接口
  PersonClass person  = new PersonClass<String>(); 
  person.add('罗毛毛');
  person.add('钱多多');
  person.add('赵一曼');
  person.printInfo();

  MemoryCache memory = new MemoryCache<Map>();
  memory.setByKey("张三", {"name":"张三","age":"28"});

  FlieCache flie = new FlieCache<String>();
  flie.setByKey("tock", "codeValue");
}

