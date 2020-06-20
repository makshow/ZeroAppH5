import 'package:flutter/material.dart';
import '../BottomNavigationWidget.dart';
import '../pages/Search.dart';
import '../pages/User.dart';
import '../pages/Product.dart';
import '../user/Login.dart';
import '../user/Register.dart';
import '../user/RegisterSecond.dart';
import '../../AppBarsPage.dart';
import '../../TabBarController.dart';
/// 配置路由 */

final routes =  {
       '/':(context)=>BottomNavigationWidget(),
        '/search':(context,{arguments})=>Search(arguments:arguments),
         '/user':(context)=>User(),
         '/product':(context,{arguments})=>Product(arguments:arguments),
         '/login':(context)=>Login(),
         '/register':(context)=>Register(),
         '/registerSecond':(context)=>RegisterSecond(),
         '/appBarsPage':(context)=>AppBarsPage(),
         '/tabBarController':(context)=>TabBarController(),
  };


 var  onGenerateRoute = (RouteSettings settings) {
       //同一处理 
       final String name  = settings.name;
       final Function pageContentBuilder = routes[name];
        if (pageContentBuilder != null) {
           if(settings.arguments!= null){
             final Route route = MaterialPageRoute(builder:(context)=>
               pageContentBuilder(context,arguments:settings.arguments ));
              return route;
           }else{
             final Route route = MaterialPageRoute(builder:(context)=>
              pageContentBuilder(context));
              return route;
           }
        } 

};
