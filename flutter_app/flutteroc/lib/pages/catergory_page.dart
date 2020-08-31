import 'package:flutter/material.dart';
import "package:flutteroc/service/dioUtils_method.dart";
import "package:flutteroc/model/category.dart";
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配

import 'package:provide/provide.dart';
import 'package:flutteroc/provide/child_category.dart';
import 'package:flutteroc/provide/category_goods_list.dart'; //右侧商品状态管理全局数据
import 'package:flutteroc/model/categoryGoodsList.dart'; //右侧数据模型
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CatergoryPage extends StatefulWidget {
  CatergoryPage({Key key, this.title = "分类"}) : super(key: key);
  final String title;

  @override
  _CatergoryPageState createState() => _CatergoryPageState();
}

class _CatergoryPageState extends State<CatergoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true, //标题居中显示
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              LeftCategoryNav(),
              Column(
                children: <Widget>[RightCategoryNav(), CategoryGoodsList()],
              )
            ],
          ),
        ));
  }
}

//左侧导航菜单
class LeftCategoryNav extends StatefulWidget {
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0; //索引

  @override
  void initState() {
    super.initState();
    _getCategory();
    _getGoodsList();
  }

  @override
  Widget build(BuildContext context) {
    // return Provide<ChildCategory>(
    //   builder: (context, child, val) {
    // _getGoodList(context);
    //     listIndex = val.categoryIndex;

    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWel(index);
        },
      ),
    );
    //   },
    // );
  }

  Widget _leftInkWel(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;

    return InkWell(
      onTap: () {
        setState(() {
          listIndex = index;
        });
        var childList = list[index].bxMallSubDto; //获取左侧酒类中子类数据
        var categoryId = list[index].mallCategoryId;
        Provide.value<ChildCategory>(context)
            .getChildCategory(childList, categoryId); //存储数据到Provide

        _getGoodsList(categoryId: categoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(95),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  /**
   * 获取左侧标题数据
   */
  void _getCategory() async {
    await DioUtils.requestWithMetodUrl(
      getCategory,
      method: "post",
    ).then((value) {
      var data = json.decode(value.toString());

      //print("分类专题接口数据============${data}");
      CategoryModel category = CategoryModel.fromJson(data);

      setState(() {
        list = category.data;
      });
      //设置默认第一条数据选择
      Provide.value<ChildCategory>(context)
          .getChildCategory(list[0].bxMallSubDto, list[0].mallCategoryId);
    });
  }

  //获取右侧分类头部数据

  void _getGoodsList({String categoryId}) async {
    var data = {
      'categoryId': categoryId == null ? "4" : categoryId,
      'categorySubId': "",
      'page': 1
    };

    //得到商品列表数据
    await DioUtils.requestWithMetodUrl(
      getMallGoods,
      parameters: data,
      method: "post",
    ).then((value) {
      var data = json.decode(value.toString());

      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      Provide.value<CategoryGoodsListProvide>(context)
          .getGoodsList(goodsList.data);
    });
  }
}

//右侧小类类别

class RightCategoryNav extends StatefulWidget {
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  List list = [
    '名酒',
    '宝封',
    '北京二锅头',
    '大明',
    '杜康',
    '汾酒',
    '高粱酒',
    '古井仿',
  ];

  //获取右侧分类头部数据
  void _getRightGoodsList(String categorySubId) async {
    var categoryId = Provide.value<ChildCategory>(context).categoryId;
    var data = {
      'categoryId': categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };
    //得到商品列表数据
    await DioUtils.requestWithMetodUrl(
      getMallGoods,
      parameters: data,
      method: "post",
    ).then((value) {
      var data = json.decode(value.toString());

      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getGoodsList(goodsList.data);
      }
    });
  }

  //模拟数据
  Widget getContainer() {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 0.8, color: Colors.black12))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal, //ListView横向显示
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (context, index) {
              return rightInkWell(
                  index, childCategory.childCategoryList[index]);
            },
          ),
        );
      },
    );
  }

  Widget rightInkWell(int index, BxMallSubDto item) {
    bool isCheck = false; //默认未被点击状态
    isCheck = (index == Provide.value<ChildCategory>(context).childIndex)
        ? true
        : false;

    return InkWell(
      onTap: () {
        print("rightInkWell点击数据============${item.mallSubName}");
        Provide.value<ChildCategory>(context)
            .changeChildIndex(index, item.mallSubId);
        _getRightGoodsList(item.mallSubId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(30),
              color: isCheck ? Colors.pink : Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getContainer();
  }
}

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  var scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(builder: (context, child, data) {
      try {
        if (Provide.value<ChildCategory>(context).page == 1) {
          scrollController.jumpTo(0.0);
        }
      } catch (e) {
        print('进入页面第一次初始化：${e}');
      }

      if (data.goodsList.length > 0) {
        return Expanded(
            child: Container(
                width: ScreenUtil().setWidth(570),
                child: EasyRefresh(
                    footer: ClassicalFooter(
                        bgColor: Colors.white,
                        textColor: Colors.pink,
                        infoColor: Colors.pink,
                        showInfo: true,
                        noMoreText:
                            Provide.value<ChildCategory>(context).noMoreText,
                        infoText: '加载中',
                        loadReadyText: '上拉加载....'),
                    child: ListView.builder(
                        itemCount: data.goodsList.length,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          return _listWidget(data.goodsList, index);
                        }),
                    onRefresh: () async {},
                    onLoad: () async {
                      
                      
                      String  noMoreText =  Provide.value<ChildCategory>(context).noMoreText;


                      if(noMoreText=='没有更多了'){
                        print("===========加载更多数据============");
                        print("===========${noMoreText}============");
                         Fluttertoast.showToast(
                            msg: "已经到底了",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.pink,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }else{
                        
                         _getMoreList();
                      }
                    })));
      } else {
        return Text('暂时没有数据');
      }
    });
  }

  Widget _listWidget(List newList, int index) {
    return InkWell(
        onTap: () {
          //Application.router.navigateTo(context,"/detail?id=${newList[index].goodsId}");
        },
        child: Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black12))),
          child: Row(
            children: <Widget>[
              _goodsImage(newList, index),
              Column(
                children: <Widget>[
                  _goodsName(newList, index),
                  _goodsPrice(newList, index)
                ],
              )
            ],
          ),
        ));
  }

  //商品图片
  Widget _goodsImage(List newList, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  //商品名称方法
  Widget _goodsName(List newList, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  //商品价格方法
  Widget _goodsPrice(List newList, int index) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        width: ScreenUtil().setWidth(370),
        child: Row(children: <Widget>[
          Text(
            '价格:￥${newList[index].presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '￥${newList[index].oriPrice}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          )
        ]));
  }

  //上拉加载更多的方法
  void _getMoreList() async {
    Provide.value<ChildCategory>(context).addPage();
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': Provide.value<ChildCategory>(context).subId,
      'page': Provide.value<ChildCategory>(context).page
    };

    //得到商品列表数据
    await DioUtils.requestWithMetodUrl(
      getMallGoods,
      parameters: data,
      method: "post",
    ).then((value) {
      var data = json.decode(value.toString());

      //print("上拉加载更多接口数据============${data}");
      CategoryGoodsListModel goodsList=  CategoryGoodsListModel.fromJson(data);


      if (goodsList.data == null) {
          print("goodsList.data接口数据============${goodsList.data}");
        Provide.value<ChildCategory>(context).changeNoMore('没有更多了');
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .addGoodsList(goodsList.data);
      }
    });
  }
}
