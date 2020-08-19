import 'dart:convert';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart"; //iOS系统风格
import 'package:flutteroc/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';//屏幕适配
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title = "首页"}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print("生命周期第四步调用initState方法");
    // getHomePageContent().then((value) {
    //   print("==============${value}");

    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true, //标题居中显示
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              List<Map> swiperDataList =
                  (data['data']['slides'] as List).cast(); // 顶部轮播组件数
              List<Map> navigatorList =(data['data']['category'] as List).cast(); //类别列表    
              String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
              String  leaderImage= data['data']['shopInfo']['leaderImage'];  //店长图片
              String  leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话 
              return ListView(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                  TopNavigator(navigatorList:navigatorList),   //导航组件
                  AdBanner(advertesPicture:advertesPicture),//广告组件   
                  LeaderPhone(leaderImage:leaderImage,leaderPhone: leaderPhone),  
                ],
              );
            } else {
              return Center(
                child: Text('加载中',
                style:TextStyle(color:Colors.black, 
                               fontSize: ScreenUtil().setSp(24,
                               allowFontScalingSelf: true))),
              );
            }
          },
        ));
  }
}

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    

    print("========设备的像素密度======${ScreenUtil.pixelRatio}");
    print("========设备的高度======${ScreenUtil.screenHeight}");
    print("========设备的宽度======${ScreenUtil.screenWidth}");

    
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
     
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              //  Application.router.navigateTo(context,"/detail?id=${swiperDataList[index]['goodsId']}");
            },
            child: Image.network("${swiperDataList[index]['image']}",
                fit: BoxFit.fill),
          );
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
        
      ),
    );
  }
}



//首页导航组件
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);
  Widget _gridViewItemUI(BuildContext context,item,index){
    // print('------------------${item}');
    return InkWell(
      onTap: (){
       // _goCategory(context,index,item['mallCategoryId']);
       print('------------------');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'],width:ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  // void _goCategory(context,int index,String categroyId) async {
  //   await request('getCategory').then((val) {
  //     var data = json.decode(val.toString());
  //     CategoryModel category = CategoryModel.fromJson(data);
  //     List   list = category.data;
  //     Provide.value<ChildCategory>(context).changeCategory(categroyId,index);
  //     Provide.value<ChildCategory>(context).getChildCategory( list[index].bxMallSubDto,categroyId);
  //     Provide.value<CurrentIndexProvide>(context).changeIndex(1);
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }
    var tempIndex=-1;
    return Container(
       color:Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(320),
      padding:EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item){
          tempIndex++;
          return _gridViewItemUI(context, item,tempIndex);
          
        }).toList(),
      ),
    );
  }
}


//广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture;

  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Container(
      margin: EdgeInsets.only(top:5.0),
      color:Colors.white,
      child: Image.network(advertesPicture),
    );
  }
}

//拨打店长电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话

  LeaderPhone({Key key, this.leaderImage,this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap:_launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    // String url = 'tel:'+leaderPhone;
     String url = 'http://jspang.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}