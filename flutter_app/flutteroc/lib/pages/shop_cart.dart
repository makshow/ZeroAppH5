import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/cart.dart';
import './cart_page/cart_item.dart';
import './cart_page/cart_bottom.dart';

class ShopCart extends StatefulWidget {
  ShopCart({Key key, this.title = "购物车"}) : super(key: key);
  final String title;

  @override
  _ShopCartState createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true, //标题居中显示
      ),
      body: FutureBuilder(
          future: _getCartInfo(context),
          builder: (context, snapshot) {
            List cartList = Provide.value<CartProvide>(context).cartList;
            if (snapshot.hasData && cartList != null) {
              return Stack(
                children: [
                  Provide<CartProvide>(
                      builder: (context, child, childCategory) {
                    cartList = Provide.value<CartProvide>(context).cartList;
                    return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        return CartItem(cartList[index]);
                      },
                    );
                  }),
                  Provide<CartProvide>(
                      builder: (context, child, childCategory) {
                    cartList = Provide.value<CartProvide>(context).cartList;
                    return Positioned(
                      bottom: 0,
                      left: 0,
                      child: cartList.length > 0 ? CartBottom() : Text(' '),
                    );
                  }),
                ],
              );
            } else {
              return Text('正在加载');
            }
          }),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}
