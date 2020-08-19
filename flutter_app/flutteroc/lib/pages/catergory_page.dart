import 'package:flutter/material.dart';

class CatergoryPage extends StatefulWidget {
  CatergoryPage({Key key}) : super(key: key);

  @override
  _CatergoryPageState createState() => _CatergoryPageState();
}

class _CatergoryPageState extends State<CatergoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'CatergoryPage',
      ),
    ));
  }
}
