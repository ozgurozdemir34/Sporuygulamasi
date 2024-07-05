import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Yagkiloorani extends StatefulWidget {
  const Yagkiloorani({super.key});
  @override
  Yagkilooranistate createState()=> Yagkilooranistate();

  
}

class Yagkilooranistate extends State<Yagkiloorani> {
  @override
  void initState(){
    super.initState();
     
    
  }
int yag=0;
int kas=0;
String yazi="";
  Future<void> giris() async{
     await Hive.initFlutter();
     Hive.openBox("Yagkiloorani");
     setState(() {
      yag=Hive.box("Yagkiloorani").get("Yag",defaultValue: 0);
      kas=Hive.box("Yagkiloorani").get("Kas",defaultValue: 0);
     });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YAĞ KİLO ORANI"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
  
}