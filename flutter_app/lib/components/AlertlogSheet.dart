
import 'dart:async';
import 'package:flutter/material.dart';



class AlertlogSheet extends Dialog {
  
  String title;
  String conten;

  AlertlogSheet({this.title = "关于我们",this.conten = ""});

  _showTimer(context){
    
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 3000), (timers ) { 
         Navigator.pop(context);
         timers.cancel();
    });
  } 

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return Material(
        
        type: MaterialType.transparency,
        child: Center(
            child: Container(
              height:300,
              width: 300,
              color: Colors.white,
              child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Padding(
                   padding: EdgeInsets.all(10),
                   child: Container(
                       color: Colors.orange,
                       child: Stack(
                          children: <Widget>[
                              Align(
                                child: Text("${this.title}"),
                                alignment: Alignment.center,
                              ),
                              Align(
                                child: InkWell(
                                   child: Icon(Icons.close),
                                   onTap: (){
                                       Navigator.pop(context);
                                   } 
                                ),
                                alignment: Alignment.centerRight
                              )
                          ]
                       )
                    )
                   ),
                   Divider(),
                   Container(
                     child: Text("${this.conten}")
                   )

              
              ],
            ),
             
            ),
        )
     
    );
  }

}
