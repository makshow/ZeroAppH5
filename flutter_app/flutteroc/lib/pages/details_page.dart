import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('商品详情'),
          centerTitle: true, //标题居中显示
        ),
        body: Center(
      child: Text(
        'Details商品详情',
      ),
    ));
  }
}
