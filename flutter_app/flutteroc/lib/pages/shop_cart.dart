import 'package:flutter/material.dart';

class ShopCart extends StatefulWidget {
  ShopCart({Key key}) : super(key: key);

  @override
  _ShopCartState createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        '购物车',
      ),
    ));
  }
}