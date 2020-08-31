import 'package:dio/dio.dart';
import 'dart:async';

const serviceUrl = 'http://v.jspang.com:8088/baixing/';
const homePageContent = 'wxmini/homePageContent'; // 商家首页信息
const homePageBelowConten = 'wxmini/homePageBelowConten'; //商城首页热卖商品拉取
const getCategory = 'wxmini/getCategory'; //商品类别信息
const getMallGoods = 'wxmini/getMallGoods'; //商品分类的商品列表
const getGoodDetailById = 'wxmini/getGoodDetailById'; //商品详细信息列表

/*
 * 封装 restful 请求
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */

class DioUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = 'http://v.jspang.com:8088/baixing/';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /* 
   * Future  返回这个对象
   * requestWithMetodUrl 网络请求调用方法
   * url 请求链接
   * parameters 请求参数
   * metthod 请求方式
   * onSuccess 成功回调
   * onError 失败回调
   */

  static Future requestWithMetodUrl(String url, {parameters, method}) async {
    parameters = parameters ?? {};
    method = method ?? GET;

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    /// 打印:请求地址-请求方式-请求参数
    print('请求地址：【' + method + '  ' + url + '】');
    print('请求参数：' + parameters.toString());

    Dio dio = createInstance();
    try {
      Response response = await dio.request(url,
          data: parameters, options: new Options(method: method));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'statusCode:${response.statusCode}---后端接口出现异常，请检测代码和服务器情况.........');
      }
      // ignore: dead_code
      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
    }
  }

  /*
   * requestWithMetod 网络请求调用方法
   * url 请求链接
   * parameters 请求参数
   * metthod 请求方式
   * onSuccess 成功回调
   * onError 失败回调
   */
  static Future<Map> requestWithMetod<T>(String url,
      {parameters,
      method,
      Function(T t) onSuccess,
      Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? GET;

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    /// 打印:请求地址-请求方式-请求参数
    print('请求地址：【' + method + '  ' + url + '】');
    print('请求参数：' + parameters.toString());

    Dio dio = createInstance();
    //请求结果
    var result;
    try {
      Response response = await dio.request(url,
          data: parameters, options: new Options(method: method));
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(result);
        }
      } else {
        throw Exception(
            'statusCode:${response.statusCode}---后端接口出现异常，请检测代码和服务器情况.........');
      }
      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }

    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
     // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数 
      var options = BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,// 响应流上前后两次接受到数据的间隔，单位为毫秒。
        responseType: ResponseType.plain,
        contentType: "application/x-www-form-urlencoded",
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: API_PREFIX,
      );

      dio = new Dio(options);
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}

/*


  ///Get请求测试
  static void getHttp() async {
    try {
      Response response = await Dio().get("http://www.google.cn");
      print("response$response");
    } catch (e) {
      print(e);
    }
  }

  ///Post请求测试
  static void postHttp<T>(
    String url, {
    parameters,
    Function(T t) onSuccess,
    Function(String error) onError,
  }) async {

    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.post(url, data: parameters);
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(response.data);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
      print('响应数据：' + response.toString());
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }
  */
