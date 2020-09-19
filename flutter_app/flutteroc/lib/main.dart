import 'package:flutter/material.dart';
import 'pages/index_page.dart';

import 'package:provide/provide.dart';//Provider
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import './provide/details_info.dart';

//配置路由文件引用
import 'package:fluro/fluro.dart';
import './router/routes.dart';
import './router/application.dart';
import './provide/cart.dart';
import './provide/currentIndex.dart';
void main() {

  var currentIndexProvide  =CurrentIndexProvide();
  var cartProvide  =CartProvide();
  var detailsInfoProvide = DetailsInfoProvide();  
  var childCategory = ChildCategory();
  var categoryGoodsListProvide= CategoryGoodsListProvide();
  var providers     = Providers();
 
  providers
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));

  runApp(ProviderNode(child:MyApp(),providers:providers));
}


class MyApp extends StatelessWidget {
  
  //06.Dio基础_Get请求和动态组件协作
  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;

    return Container(
      child: MaterialApp(

      debugShowCheckedModeBanner: false,//关闭显示debug模式
      onGenerateRoute: Application.router.generator,//配置路由引用
      title: '百姓生活家+',
      
      theme: ThemeData(
        // primarySwatch: Colors.orange,  目前的主题颜色(primarySwatch)只有固定色值
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor:Colors.pink
      ),
       home: IndexPages(),
     ),
    );
  }




}

