import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          ElevatedButton(onPressed: () {}, child: Text("Bacak")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {}, child: Text("  Bel  ")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Gögüs")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {}, child: Text(" Kalça ")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {}, child: Text("  Kol  ")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {}, child: Text(" Omuz ")),
        ],
      ),
    );
  }
}
