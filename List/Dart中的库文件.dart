
import 'dart:convert';
import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:date_format/date_format.dart';

/**在Dart中,库的使用提供import关键字引入
 * library指令可以创建一个库,每个Dart文件都是一个库,即使没有使用library指令来指定
 
Dart中的库主要有三种：

我们自定义的库
import 'lib/xxx.dart';
系统内置库
import 'dart:math';
import 'dart:io';
import 'dart:convert';
Pub包管理系统中的库
https://pub.dev/packages
https://pub.flutter-io.cn/packages
https://pub.dartlang.org/flutter/
1、需要在自己想项目根目录新建一个pubspec.yaml
2、在pubspec.yaml文件 然后配置名称 、描述、依赖等信息
3、然后运行 pub get 获取包下载到本地
4、项目中引入库 import 'package:http/http.dart' as http; 看文档使用
5、async是让方法变成异步执行方法,await是等待异步方法执行完成

 *  
 * 
 */


void main() async {

   var result = await requestGetWithHttpsApi();
   //print(result);



  
}

//http://mock-api.com/wnaDo1g1.mock/common_tj/start_page 发起异步网络请求
//https://mockapi.eolinker.com/v6CRCcTde0e0448976e4f45e4c03b5dfc1ec40290d21629/api/index/const
//http://news-at.zhihu.com/api/3/stories/latest

requestPostWithHttpsApi() async{
// token	DB201TWED770EB996
// uid	GISC07ZP02YJUISYVX

//1.创建 HttpClient对象
  var httpClient = new  HttpClient();

  var url = new Uri.https("mockapi.eolinker.com", "/v6CRCcTde0e0448976e4f45e4c03b5dfc1ec40290d21629/api/index/const"); 

  //3.发起请求,等待请求
  var requst = await httpClient.postUrl(url);
  //4.关闭请求,等待响应
  var response = await requst.close();

  //5.解码响应的内容 
  return await response.transform(utf8.decoder).join();

}

requestGetWithHttpsApi() async{
   
  //1.创建 HttpClient对象
  var httpClient = new  HttpClient();

  //2.创建uri对象 
  var uri = new Uri.http("news-at.zhihu.com", "/api/3/stories/latest"); 
   //var uri = new Uri.http("mock-api.com", "/wnaDo1g1.mock/common_tj/start_page"); 

  //3.发起请求,等待请求
  var requst = await httpClient.getUrl(uri);
  //4.关闭请求,等待响应
  var response = await requst.close();

  //5.解码响应的内容 
  return await response.transform(utf8.decoder).join();



}



