import 'package:flutter/material.dart';
import '../model/details.dart';
import 'package:flutteroc/service/dioUtils_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier{
  
   DetailsModel goodsInfo;
   bool isLeft = true;
   bool isRight = false;

  //从后台获取商品信息

  getGoodsInfo(String id )  async{
  
    var formData = { 'goodId':id, };
      
    await DioUtils.requestWithMetodUrl(
        getGoodDetailById,
        parameters: formData,
        method: "post",
      ).then((value) {
        var responseData = json.decode(value.toString());
        goodsInfo=DetailsModel.fromJson(responseData);
        notifyListeners();

        print("从后台获取商品详情接口数据============${responseData}");
      });

  }

  //改变tabBar的状态
  changeLeftAndRight(String changeState){
    if(changeState=='left'){
      isLeft=true;
      isRight=false;
    }else{
      isLeft=false;
      isRight=true;
    }
     notifyListeners();

  }


}