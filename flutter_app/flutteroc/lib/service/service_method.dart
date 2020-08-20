

import "package:dio/dio.dart";
import 'dart:async';
import '../config/service_url.dart';

//PSOT 请求 
Future requestPostWithUrl(url, params) async {

}

//GET请求
Future requestGetWithWithUrl(url, params) async {}

//获得商城首页信息的方法
Future getHomePageContent() async {
  try {
   // print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    dio.options.contentType = "application/x-www-form-urlencoded";
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    //response = await dio.post("/test", data: {"id": 12, "name": "wendu"});
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}


//获得火爆专区商品的方法
Future getHomePageBeloConten() async {
  try {
    print('开始获取下拉列表数据.................');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    int page = 1;
    response = await dio.post(servicePath['homePageBelowConten'], data: page);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
