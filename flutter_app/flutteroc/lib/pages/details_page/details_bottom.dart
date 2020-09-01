import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class DetailsBottom extends StatelessWidget {
  const DetailsBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(750),
        color: Colors.white,
        height: ScreenUtil().setHeight(100),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                 InkWell(
                  onTap: (){
                      // Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                      // Navigator.pop(context);
                      print("点击购物车");
                  },
                  child: Container(
                      width: ScreenUtil().setWidth(110) ,
                      alignment: Alignment.center,
                      child:Icon(
                            Icons.shopping_cart,
                            size: 35,
                            color: Colors.red,
                          ), 
                    ) ,
                ),
              ],
            ),
            
            InkWell(
              onTap: () async {
                // await Provide.value<CartProvide>(context).save(goodsID, goodsName, count, price, images);
                print("点击加入购物车");
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(80),
                color: Colors.green,
                child: Text(
                  '加入购物车',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                // await Provide.value<CartProvide>(context).remove();
                 print("点击马上购买");
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(80),
                color: Colors.red,
                child: Text(
                  '马上购买',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                ),
              ),
            ),
          ],
        ));
  }
}
