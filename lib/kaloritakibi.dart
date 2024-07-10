import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';

import 'package:sporuygulamasi/anasayfa.dart';

class Kaloritakibi extends StatefulWidget {
  const Kaloritakibi({super.key});

  @override
  _KaloritakibiState createState() => _KaloritakibiState();
}

class _KaloritakibiState extends State<Kaloritakibi> {
  TextEditingController limitController = TextEditingController();
  TextEditingController alinancontroller = TextEditingController();

  int limit = 0;
  int alinan = 0; // Değişiklik burada
  String yazi = "";

  @override
  void initState() {
    super.initState();
    
    _openHiveBox();
  }

  Future<void> _openHiveBox() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('Kalori'); // 'Kalori' olarak değiştirildi
    Hive.box("Kalori").clear();
    setState(() {
      limit = box.get('Limit', defaultValue: 0);
      alinan = box.get('alinan', defaultValue: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double percent = min(alinan / limit, 1.0);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Hive.box('Kalori').put('Limit', limit); // 'Kalori' olarak değiştirildi
                  Hive.box('Kalori').put('alinan', alinan); // 'Kalori' olarak değiştirildi
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Anasayfa()));
                },
                icon: Icon(Icons.keyboard_backspace));
          },
        ),
        backgroundColor: Color.fromARGB(255, 231, 31, 31),
        title: Text("KALORİ TAKİBİ"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            width: 100,
            child: Text(
              "$alinan/$limit",
              style: TextStyle(fontFamily: Platform.localeName),
            ),
          ),
          LinearPercentIndicator(
            percent:percent,
            progressColor: Colors.green,
            lineHeight: 30,
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: limitController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen bir değer girin';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Limit belirleyiniz',
                border: OutlineInputBorder(),
              ),
            ),
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
                  Hive.box('Kalori').put('Limit', limit); // 'Kalori' olarak değiştirildi
                } else {
                  yazi = "Lütfen boş bırakmayınız";
                }
              });
            },
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: alinancontroller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen bir değer girin';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Miktar Giriniz(Joule cinsinden)',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (alinancontroller.text.isEmpty) {
                      yazi = "Lütfen boş bırakmayınız";
                    } else {
                      int alinanMiktar =
                          int.tryParse(alinancontroller.text) ?? 0;
                      alinan -= alinanMiktar;
                      if (alinan < 0) alinan = 0; // alinan 0'ın altında ise 0 yap
                      Hive.box('Kalori').put('alinan', alinan); // 'Kalori' olarak değiştirildi
                      yazi = "";
                    }
                  });
                },
                child: Text("Miktarı Düşür"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (alinancontroller.text.isEmpty) {
                      yazi = "Lütfen boş bırakmayınız";
                    } else {
                      int alinanMiktar =
                          int.tryParse(alinancontroller.text) ?? 0;
                      alinan += alinanMiktar;
                      Hive.box('Kalori').put('alinan', alinan); // 'Kalori' olarak değiştirildi
                      yazi = "";
                    }
                  });
                },
                child: Text("Miktarı Ekle"),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            yazi,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
