
import 'package:flutter/material.dart';

import "package:flutteroc/database/databaseTools.dart";
import "package:flutteroc/database/tablesInit.dart";
import 'dart:math';


class DataBaseTest extends StatefulWidget {
  DataBaseTest({Key key,this.title = "DataBase数据库"}) : super(key: key);
  final String title;
  @override
  _DataBaseTestState createState() => _DataBaseTestState();
}



class _DataBaseTestState extends State<DataBaseTest> {
  
   DataBaseTools dbTools;
  @override
  void initState() {
    super.initState();
    initDB();
  }

  void initDB() async {
    TablesInit tables = TablesInit();
    tables.init();
    dbTools = new DataBaseTools();
  }

  void insertData() async {
    await dbTools.open();
    Map<String, Object> par = Map<String, Object>();
     par['uid'] = Random().nextInt(10);
    par['fuid'] = Random().nextInt(10);
    par['type'] = Random().nextInt(2);

    int flag = await dbTools.insertByHelper('relation', par);
    print('------------flag-------:$flag');

    await dbTools.close();
    queryData();
  }

  void queryData() async {
    await dbTools.open();
    List<Map> data = await dbTools.queryList("SELECT * FROM relation");
    //List<Map> data = await dbTools.queryListByHelper('relation', ['id','uid','fuid','type'], 'uid=?', [5]);
    print('data：$data');
    

    if (data != null) {
      data.forEach((element) {
        
           print('json格式化：$element');
      }); 

    }
    await dbTools.close();
  }


   void delete() async{
    await dbTools.open();
    dbTools.delete('DELETE FROM relation', null);
    //dbTools.deleteByHelper('relation','uid=? and fuid=?',[1,6]);
    await dbTools.close();
    queryData();
  }

  void update() async{
    await dbTools.open();
    //dbTools.update('UPDATE relation SET fuid = ?, type = ? WHERE uid = ?', [Random().nextInt(10),Random().nextInt(10),5]);
    Map<String,Object> par = Map<String,Object>();
    par['fuid'] = Random().nextInt(10);
    dbTools.updateByHelper('relation', par, 'type=? and uid=?', [0,2]);
    await dbTools.close();
    queryData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true, //标题居中显示
      ),
      body: Column(
        children: <Widget>[
          // Container(
          //     height: 300,
          //     child: ListView.builder(
          //       itemCount: data.length,
          //       itemBuilder: (context, index) {
          //         return ListTile(
          //           title: Text(data[index]),
          //         );
          //       },
          //     )),
          RaisedButton(
            onPressed: () {
              print("-------object--------");
              insertData();
            },
            child: Text("增加"),
          ),
          RaisedButton(
            onPressed: () {
              print("-------刷新--------");
              queryData();
            },
            child: Text("刷新"),
          ),
          RaisedButton(
            onPressed: () {
              print("-------插入更新--------");
              update();
            },
            child: Text("插入更新"),
          ),
             RaisedButton(
            onPressed: () {
              print("-------删除--------");
              delete();
            },
            child: Text("删除"),
          ),
    
        ],
      ),
    );
  }
}