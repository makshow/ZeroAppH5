import 'dart:convert';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart"; //iOS系统风格
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配
import 'package:url_launcher/url_launcher.dart';
import "package:flutteroc/service/dioUtils_method.dart";
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutteroc/router/application.dart';
import 'package:flutter/services.dart';

// import 'package:provide/provide.dart';
// import '../provide/child_category.dart';
// import '../model/category.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title = "首页"}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> hotGoodsList = [{"title":"极光推送"}];
  List  swiper = [
    
     {
        "link":"http://zt.cjwsc.com/zt/all_page/shuangdan20171221/index.html",
        "image":"http://static.cjwsc.com//image/76/78/b4/7678b4ebf83bf5a8922db318078c891b.jpg"
      },
      {
        "link":"http://zt.cjwsc.com/zt/all_page/KONKA1222/index.html",
        "image":"http://static.cjwsc.com//image/b4/a7/1b/b4a71ba0c3b3c2e5428a63351081f2a3.jpg"
      },
      {
        "link":"http://zt.cjwsc.com/zt/all_page/supor1225/index.html",
        "image":"http://static.cjwsc.com//image/fc/85/fd/fc85fd9480f1c86e16d9378759dfceb1.jpg"
      },
      {
        "link":"http://zt.cjwsc.com/zt/all_page/nuanxinjh1218/index.html",
        "image":"http://static.cjwsc.com//image/66/aa/ba/66aabaa6063e4519ab4c204d5d6839de.jpg"
      },
      {
        "link":"http://zt.cjwsc.com/zt/all_page/weiyds1222_m/index.html",
        "image":"http://static.cjwsc.com//image/b4/df/80/b4df80a514173af881ff0d67dcc4a05a.jpg"
      },
      {
        "link":"http://zt.cjwsc.com/zt/20171212/2_jinzhish/index.html",
        "image":"http://static.cjwsc.com//image/47/3b/58/473b58449ebacecacacef7b5dc10a130.jpg"
      },
      {
        "link":"http://zt.cjwsc.com/zt/2017nianhuojie/main/nianhj-main-m.html",
        "image":"http://static.cjwsc.com//image/30/22/d5/3022d5c7aa51e376e21cf7a16aedf973.jpg"
      }
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    

    rootBundle.loadString('assets/data.json').then((value){
        
        var data =  json.decode(value);
        print("读取本地json数据---$data");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true, //标题居中显示
        ),
        body: FutureBuilder(
          future: DioUtils.requestWithMetodUrl(
            homePageContent,
            parameters: {'lon': '115.02932', 'lat': '35.76189'},
            method: "post",
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              List<Map> swiperDataList =
                  (data['data']['slides'] as List).cast(); // 顶部轮播组件数
              List<Map> navigatorList =
                  (data['data']['category'] as List).cast(); //类别列表
              String advertesPicture =
                  data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
              String leaderImage =
                  data['data']['shopInfo']['leaderImage']; //店长图片
              String leaderPhone =
                  data['data']['shopInfo']['leaderPhone']; //店长电话
              List<Map> recommendList =
                  (data['data']['recommend'] as List).cast(); // 商品推荐
              String floor1Title =
                  data['data']['floor1Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
              String floor2Title =
                  data['data']['floor2Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
              String floor3Title =
                  data['data']['floor3Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
              List<Map> floor1 =
                  (data['data']['floor1'] as List).cast(); //楼层1商品和图片
              List<Map> floor2 =
                  (data['data']['floor2'] as List).cast(); //楼层1商品和图片
              List<Map> floor3 =
                  (data['data']['floor3'] as List).cast(); //楼层1商品和图片

              return EasyRefresh(
                footer: ClassicalFooter(
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    infoColor: Colors.pink,
                    showInfo: true,
                    noMoreText: '',
                    infoText: '加载中',
                    loadReadyText: '上拉加载....'),
                child: ListView(
                  children: <Widget>[
                    SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                    TopNavigator(navigatorList: navigatorList), //导航组件
                    AdBanner(advertesPicture: advertesPicture), //广告组件
                    LeaderPhone(
                        leaderImage: leaderImage, leaderPhone: leaderPhone),
                    Recommend(recommendList: recommendList),
                    FloorTitle(picture_address: floor1Title), //楼层标题
                    FloorContent(floorGoodsList: floor1), //楼层商品组件
                    FloorTitle(picture_address: floor2Title),
                    FloorContent(floorGoodsList: floor2),
                    FloorTitle(picture_address: floor3Title),
                    FloorContent(floorGoodsList: floor3),
                    _hotGoods(),
                  ],
                ),
                onRefresh: () async {},
                onLoad: () async {
                  var parameters = {"page": page};

                  await DioUtils.requestWithMetodUrl(
                    homePageBelowConten,
                    parameters: parameters,
                    method: "post",
                  ).then((value) {
                    var data = json.decode(value.toString());
                    List<Map> newGoodsList = (data['data'] as List).cast();
                    setState(() {
                      hotGoodsList.addAll(newGoodsList);
                      page++;
                    });

                    print("取火爆专题接口数据============${newGoodsList}");
                  });
                },
              );
            } else if(swiper.length>0){
               
                  return  ListView(
                     children: [
                         SwiperDiy(swiperDataList:swiper), //页面顶部轮播组件
                     ],
                  );
                  

            }else {
              return Center(
                child: Text('加载中',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil()
                            .setSp(24, allowFontScalingSelf: true))),
              );
            }
          },
        ));
  }

  //申明获取火爆专题接口数据方法
  void _getHotGoods() {
    var parameters = {"page": page};

    DioUtils.requestWithMetodUrl(
      homePageBelowConten,
      parameters: parameters,
      method: "post",
    ).then((value) {
      var data = json.decode(value.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });

      print("取火爆专题接口数据============${newGoodsList}");
    });
  }

  //火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Text('火爆专区'),
  );

  //火爆专区子项
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
            onTap: () {
              Application.router
                  .navigateTo(context, "/detail?id=${val['goodsId']}", transition: TransitionType.fadeIn);
            
            },
            child: Container(
              width: ScreenUtil().setWidth(372),
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(bottom: 3.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                    val['image'],
                    width: ScreenUtil().setWidth(375),
                  ),
                  Text(
                    val['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                  ),
                  Row(
                    children: <Widget>[
                      Text('￥${val['mallPrice']}'),
                      Text(
                        '￥${val['price']}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough), //价格横线显示样式
                      )
                    ],
                  )
                ],
              ),
            ));
      }).toList();

      return Wrap(
        spacing: 2, //返回几列显示
        children: listWidget, //加载子组件
      );
    } else {
      return Text(' ');
    }
  }

  //火爆专区组合
  Widget _hotGoods() {
    return Container(
        child: Column(
      children: <Widget>[
        hotTitle,
        _wrapList(),
      ],
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
              Application.router.navigateTo(context,"/detail?id=${swiperDataList[index]['goodsId']}",transition: TransitionType.cupertino);
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
  Widget _gridViewItemUI(BuildContext context, item, index) {
    // print('------------------${item}');
    return InkWell(
      onTap: () {
        //_goCategory(context,index,item['mallCategoryId']);
        print('------------------${item}');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  void _goCategory(context,int index,String categroyId) async {
    // await request('getCategory').then((val) {
    //   var data = json.decode(val.toString());
    //   CategoryModel category = CategoryModel.fromJson(data);
    //   List   list = category.data;
    //   Provide.value<ChildCategory>(context).changeCategory(categroyId,index);
    //   Provide.value<ChildCategory>(context).getChildCategory( list[index].bxMallSubDto,categroyId);
    //   Provide.value<CurrentIndexProvide>(context).changeIndex(1);
    // });
  }


  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }
    var tempIndex = -1;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),//禁止回弹
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item) {
          tempIndex++;
          return _gridViewItemUI(context, item, tempIndex);
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
      margin: EdgeInsets.only(top: 5.0),
      color: Colors.white,
      child: Image.network(advertesPicture),
    );
  }
}

//拨打店长电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:' + leaderPhone;
    //String url = 'http://jspang.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommedList(context)],
      ),
    );
  }

//推荐商品标题
  Widget _titleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
        child: Text('商品推荐', style: TextStyle(color: Colors.pink)));
  }

  Widget _recommedList(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(350),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index, context);
        },
      ),
    );
  }

  Widget _item(index, context) {
    return InkWell(
      onTap: () {
         Application.router.navigateTo(context,"/detail?id=${recommendList[index]['goodsId']}",transition: TransitionType.cupertino);
      },
      child: Container(
        width: ScreenUtil().setWidth(280),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

//楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address; // 图片地址
  FloorTitle({Key key, this.picture_address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}

//楼层商品组件
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_firstRow(context), _otherGoods(context)],
      ),
    );
  }

  Widget _firstRow(context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(context, floorGoodsList[1]),
            _goodsItem(context, floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoodsList[3]),
        _goodsItem(context, floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(context, Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(context, "/detail?id=${goods['goodsId']}",transition: TransitionType.cupertino);
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}
