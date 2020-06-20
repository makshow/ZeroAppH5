import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../components/AlertlogSheet.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class CarPage extends StatefulWidget {
  CarPage({Key key}) : super(key: key);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {


getRequest() async {
   var url = 'http://apiv2.yangkeduo.com/v2/goods';
  
  var response = await http.get(url);

  // print(response.statusCode);

  //  print(convert.jsonDecode(response.body));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $jsonResponse');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

postRequest() async{

  print("PSOT网络请求调用");

  var url = 'https://example.com/whatsit/create';
  var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(await http.read('https://example.com/foobar.txt'));


}

dioRequest() async {
  var dio = Dio();
  Response response = await dio.get('http://apiv2.yangkeduo.com/v2/goods');
  print(response.data);

  Response result  = await dio.post("/test", data: {"id": 12, "name": "wendu"});
  //response = await Future.wait([dio.post("/info"), dio.get("/token")]);
  //response = await dio.download("https://www.google.com/", "./xx.html");
}

@override
void initState() { 
  super.initState();
  
  // print(json.encode({
  //     "user":"smell",
  //     "age":"20",
  //     "height":"175"
  // }));

  //homeGoodsList_URL:'http://apiv2.yangkeduo.com/v2/goods',
}


  List<Map> imageList = [
    {
      "url":
          "https://static.cjwsc.com//image/93/c8/ef/93c8ef23bc7e1139e54de66090ddd2b5.jpg"
    },
    {
      "url":
          "https://static.cjwsc.com//image/58/4f/4e/584f4ea908341ee0664e60baa9170698.jpg"
    },
    {
      "url":
          "https://static.cjwsc.com//image/6f/9c/4d/6f9c4d009ed7eb7c6332fb1b0904811d.jpg"
    }
  ];

   

_alertTop(){ 
 showDialog(
        context: context,
        builder: (context) {
          return AlertlogSheet(
             title:"AlertlogSheet",
             conten:"描述"
          );
        });
  
}



_toast(){
  //showToast("所爱隔山海，山海皆可平", duration:2,  gravity: Toast.CENTER);
  Fluttertoast.showToast(
        msg: "提示信息",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
        
    );
}

_modeBottomSheet(){

 showModalBottomSheet(
   context: context, builder:(context){
      return Container(
           child: Column(
               children: <Widget>[
                  ListTile(
                    title: Text("分享a"),
                    onTap: (){
                      print("分享a");
                    },
                  ),

                  ListTile(
                    title: Text("分享b"),
                    onTap: (){
                      print("分享b");
                    },
                  ),

                  ListTile(
                    title: Text("分享c"),
                    onTap: (){
                      print("分享c");
                    },
                  ),
               ],
           ),
      );
   }
  
   );

}
  _simpleDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("提示信息"),
            children: <Widget>[
               SimpleDialogOption(
                 child:Text(" SimpleDialogOption A ") ,
                 onPressed: () {
                    print("取消 - SimpleDialogOption A");
                    Navigator.pop(context);
                  },
               ),

               SimpleDialogOption(
                 child:Text(" SimpleDialogOption B ") ,
                 onPressed: () {
                    print("确定 - SimpleDialogOption B");
                    Navigator.pop(context);
                  },
               ),
            ],
          );
        });
  }

  _alerDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("需要删除提示信息"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    print("取消");
                    Navigator.pop(context);
                  },
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    print("确定");
                    Navigator.pop(context);
                  },
                  child: Text("确定"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TexField文本组件'),
        centerTitle: true, //标题居中显示
      ),
      body: Column(
        children: <Widget>[
          Container(
              //height: 150,
              //width: double.infinity,//宽带自适配
              child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  imageList[index]["url"],
                  fit: BoxFit.fill,
                );
              },
              itemCount: imageList.length,
              pagination: SwiperPagination(),
              loop: true, //循环模式
              autoplay: true, //轮播
              onIndexChanged:(int index){//轮播事件
                   //print("onIndexChanged$index");
              },
              onTap:(int index){
                  print("onTap$index");
              },
              //autoplayDelay:5,
            ),
          )),
          RaisedButton(child: Text("_alerDialog"), onPressed: _alerDialog),
          RaisedButton(child: Text("_simpleDialog"), onPressed: _simpleDialog),
          RaisedButton(child: Text("_modeBottomSheet"), onPressed: _modeBottomSheet),
          RaisedButton(child: Text("第三方_toast"), onPressed:_toast),
          RaisedButton(child: Text("自定义alerDialog"), onPressed:_alertTop),
          RaisedButton(child: Text("GET网络请求"), onPressed:getRequest),
          // RaisedButton(child: Text("POST网络请求"), onPressed:postRequest),
          RaisedButton(child: Text("DIO网络请求"), onPressed:dioRequest),
          // RadioListTile(
          //     secondary: Icon(Icons.ac_unit),
          //     subtitle: Text("CheckboxListTi----"),
          //     title: Text("CheckboxListTile"),
          //     value: 1,
          //     groupValue: 1,
          //     onChanged: (value) => {print(value)})
        ],
      ),
      // body: Swiper(
      //   itemBuilder: (BuildContext context, int index) {
      //     return Image.network(
      //       imageList[index]["url"],
      //       fit: BoxFit.fill,
      //     );
      //   },
      //   // itemCount: imageList.length,
      //   // itemWidth: 300.0,
      //   // itemHeight: 400.0,
      //   // layout: SwiperLayout.TINDER,
      //   // itemCount: 10,
      //   // itemWidth: 300.0,
      //   // layout: SwiperLayout.STACK,
      //   itemCount: imageList.length,
      //   pagination:  SwiperPagination(),
      //  // 左右箭头 control:  SwiperControl(),

      // )
    );
  }
}
