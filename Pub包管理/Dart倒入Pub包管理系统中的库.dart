import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

void main(List<String> arguments) async {

  print('-------Number of books about http: --------');
 

  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  //var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';
  var url = 'http://mock-api.com/wnaDo1g1.mock/common_tj/start_page';


  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // var itemCount = jsonResponse['totalItems'];
    // print('Number of books about http: $itemCount.');
    print('jsonResponse =  $jsonResponse');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  /**---------------------时间转换输出--------------------------------- */
  print(formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));
  print(formatDate(DateTime(1989, 2, 21), [yy, '-', m, '-', dd]));
  print(formatDate(DateTime(1989, 2, 1), [yy, '-', m, '-', d]));

  print(formatDate(DateTime(1989, 2, 1), [yy, '-', MM, '-', d]));
  print(formatDate(DateTime(1989, 2, 21), [yy, '-', M, '-', d]));

  print(formatDate(DateTime(1989, 2, 1), [yy, '-', M, '-', d]));

  print(formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', DD]));
  print(formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', D]));

  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss]));

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [hh, ':', nn, ':', ss, ' ', am]));

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [hh, ':', nn, ':', ss, ' ', am]));

  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [hh]));
  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [h]));

  print(formatDate(DateTime(1989, 02, 1, 5), [am]));
  print(formatDate(DateTime(1989, 02, 1, 15), [am]));

  print(
      formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, z]));

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));

  print(formatDate(DateTime(1989, 02, 21), [yy, ' ', w]));
  print(formatDate(DateTime(1989, 02, 21), [yy, ' ', W]));

  print(formatDate(DateTime(1989, 12, 31), [yy, '-W', W]));
  print(formatDate(DateTime(1989, 1, 1), [yy, '-', mm, '-w', W]));

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));


/**----------------相同类冲突解决--------------- */
/**
 * Dart库的重命名 Dart冲突解决
1、冲突解决
当引入两个库中有相同名称标识符的时候，如果是java通常我们通过写上完整的包名路径来指定使用的具体标识符，甚至不用import都可以，但是Dart里面是必须import的。当冲突的时候，可以使用as关键字来指定库的前缀。如下例子所示：
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

Element element1 = new Element(); // Uses Element from lib1.
lib2.Element element2 = new lib2.Element(); // Uses Element from lib2.


import 'lib/Person1.dart';
import 'lib/Person2.dart' as lib;

main(List<String> args) {
  Person p1=new Person('张三', 20);
  p1.printInfo();


  lib.Person p2=new lib.Person('李四', 20);

  p2.printInfo();

}
 * 
 * 
 */

/***-----------------部分导入--------------------- */
/**
 * 如果只需要导入库的一部分，有两种模式：
模式一：只导入需要的部分，使用show关键字，如下例子所示：
import 'package:lib1/lib1.dart' show foo;
模式二：隐藏不需要的部分，使用hide关键字，如下例子所示：
import 'package:lib2/lib2.dart' hide foo;


// import 'lib/myMath.dart' show getAge;

 import 'lib/myMath.dart' hide getName;

void main(){
//  getName();
  getAge();
}

 * 
 * 
 */

/***-----------------延迟加载--------------------- */
/**
 * 也称为懒加载，可以在需要的时候再进行加载。懒加载的最大好处是可以减少APP的启动时间
 * 懒加载使用deferred as关键字来指定，如下例子所示：

    import 'package:deferred/hello.dart' deferred as hello;

    当需要使用的时候，需要使用loadLibrary()方法来加载：

    greet() async {
      await hello.loadLibrary();
      hello.printGreeting();
    }

    
 */

}