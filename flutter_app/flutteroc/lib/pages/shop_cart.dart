import 'package:flutter/material.dart';


class ShopCart extends StatefulWidget {
  ShopCart({Key key, this.title = "购物车"}) : super(key: key);
  final String title;

  @override
  _ShopCartState createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  List<String> data = ["购物车","购物车2"];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true, //标题居中显示
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: 300,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]),
                  );
                },
              )),
         
    
        ],
      ),
    );
  }
}


