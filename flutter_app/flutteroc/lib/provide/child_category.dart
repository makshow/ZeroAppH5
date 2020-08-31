import 'package:flutter/material.dart';
import '../model/category.dart';


//ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier{

    //模拟初步数据
    List<BxMallSubDto> childCategoryList = []; //商品列表
    int childIndex = 0;//子类高亮索引
    int categoryIndex=0; //大类索引
    String categoryId = '4'; //大类ID
    String subId =''; //小类ID 
    int page=1;  //列表页数，当改变大类或者小类时进行改变
    String noMoreText = ''; //显示更多的表示
    bool isNewCategory= true;

    getChildCategory(List<BxMallSubDto> list,String id){
    //切换左侧标签数据更新page = 1 noMoreText = "" subId=''
     page=1;
     subId=''; //点击大类时，把子类ID清空
     noMoreText='';

    childIndex = 0;
    categoryId = id;
    BxMallSubDto all=  BxMallSubDto();
      all.mallSubId='';
      all.mallCategoryId='00';
      all.mallSubName = '全部';
      all.comments = 'null';
      childCategoryList=[all];
      childCategoryList.addAll(list);     
  
      //改变的时候监听 
      notifyListeners();
    }

   //改变子类索引
    changeChildIndex(int index,String id){
    
       childIndex=index;
       //子类标签切换加载数据时,page = 1 noMoreText = "" subId=id
        page=1;
        noMoreText='';
        subId=id;
       notifyListeners();
    }

  
    
    //增加Page的方法f
    addPage(){
      page++;
    }
    //改变noMoreText数据  
    changeNoMore(String text){
      noMoreText=text;
      notifyListeners();
    }
}