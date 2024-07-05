import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sporuygulamasi/bacak.dart';
import 'package:sporuygulamasi/bel.dart';
import 'package:sporuygulamasi/gogus.dart';
import 'package:sporuygulamasi/kalca.dart';
import 'package:sporuygulamasi/kol.dart';
import 'package:sporuygulamasi/omuz.dart';

class Olcumler extends StatelessWidget {
  const Olcumler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ÖLÇÜMLER",
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bacak()));
          }, child: Text("Bacak")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bel()));
          }, child: Text("  Bel  ")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Gogus()));
          }, child: Text("Gögüs")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Kalca()));
          }, child: Text(" Kalça ")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Kol()));
          }, child: Text("  Kol  ")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Omuz()));
          }, child: Text(" Omuz ")),
        ],
      ),
    );
  }
}
