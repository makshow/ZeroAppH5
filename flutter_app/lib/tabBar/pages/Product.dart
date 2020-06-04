import 'package:flutter/material.dart';


class Product extends StatefulWidget {

   final arguments;
   Product({Key key,this.arguments}) : super(key: key);

    @override
    _ProductState createState() => _ProductState(arguments:this.arguments);

}


class _ProductState extends State<Product> {

  Map arguments;
  _ProductState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品页面"),
         centerTitle: true, //标题居中显示
      ),
       body: Text('商品页面${arguments!=null?arguments['id']:'0'}'),
    );
  }
}