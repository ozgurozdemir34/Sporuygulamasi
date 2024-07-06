import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';

import 'package:sporuygulamasi/anasayfa.dart';

class Suicme extends StatefulWidget {
  const Suicme({Key? key}) : super(key: key);

  @override
  _SuicmeState createState() => _SuicmeState();
}

class _SuicmeState extends State<Suicme> {
  TextEditingController limitController = TextEditingController();

  int limit = 2000;
  int icilen = 0;
  String yazi = "";

  @override
  void initState() {
    super.initState();
    _openHiveBox();
  }

  Future<void> _openHiveBox() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('kutu');
    setState(() {
      limit = box.get('Limit', defaultValue: 2000);
      icilen = box.get('İçilen', defaultValue: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double percent = min(icilen / limit, 1.0);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Hive.box('kutu').put('Limit', limit);
                  Hive.box('kutu').put('İçilen', icilen);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Anasayfa()));
                },
                icon: Icon(Icons.keyboard_backspace));
          },
        ),
        backgroundColor: Color.fromARGB(255, 231, 31, 31),
        title: Text("SU TAKİBİ"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            width: 100,
            child: Text(
              "$icilen/$limit",
              style: TextStyle(fontFamily: Platform.localeName),
            ),
          ),
          LinearPercentIndicator(
            percent: percent,
            progressColor: Colors.green,
            lineHeight: 30,
          ),
          TextField(
            controller: limitController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 50,
          ),
          CupertinoButton(
              child: Text(
                  "Yukarıdaki alana değer girdikten sonra\n buraya basarak limiti belirleyebilirsiniz"),
              onPressed: () {
                setState(() {
                  int? sayi = int.tryParse(limitController.text);
                  if (sayi != null) {
                    limit = sayi;
                    yazi = "";
                    Hive.box('kutu').put('Limit', limit);
                  } else {
                    yazi = "Lütfen boş bırakmayınız";
                  }
                });
              }),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  icilen = icilen + 500;
                  Hive.box('kutu').put('İçilen', icilen);
                });
              },
              child: Text("500 Ml  İçildi")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  icilen = icilen + 200;
                  Hive.box('kutu').put('İçilen', icilen);
                });
              },
              child: Text("200 Ml İçildi")),
          Text(
            yazi,
            style: TextStyle(color: Colors.red),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  icilen = icilen - 100;
                  Hive.box('kutu').put('İçilen', icilen);
                });
              },
              child: Text("İçilen miktarı 100 Ml düşür"))
        ],
      ),
    );
  }
}
