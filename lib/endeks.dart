import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Endeks extends StatefulWidget {
  @override
  EndeksState createState() => EndeksState();
}

class EndeksState extends State<Endeks> {
  final TextEditingController kiloController = TextEditingController();
  final TextEditingController boyController = TextEditingController();

  double sonuc = 0;
  String yazi = "";
  String normallik = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("VÜCUT KİTLE ENDEKSİ"),
        backgroundColor: Color.fromARGB(255, 231, 31, 31),
      ),
      body: Column(
        children: [
          TextField(
            controller: boyController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(hintText: "Boyunuzu giriniz (CM)"),
          ),
          TextField(
            controller: kiloController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(hintText: "Kilonuzu giriniz (KG)"),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (kiloController.text.isEmpty || boyController.text.isEmpty) {
                setState(() {
                  yazi = "Lütfen bütün alanları doldurunuz";
                  normallik = "";
                });
              } else {
                setState(() {
                  double kilo = double.parse(kiloController.text);
                  double boy = double.parse(boyController.text);
                  sonuc = kilo / ((boy / 100) * (boy / 100));
                  yazi = "Vücut kitle endeksiniz: ${sonuc.toStringAsFixed(2)}";
                  
                  if (sonuc < 18.5) {
                    normallik = "Endeksinize göre zayıfsınız";
                  } else if (sonuc >= 18.5 && sonuc < 25) {
                    normallik = "Endeksinize göre normalsiniz";
                  } else if (sonuc >= 25 && sonuc < 30) {
                    normallik = "Endeksinize göre kilolusunuz";
                  } else {
                    normallik = "Endeksinize göre aşırı kilolusunuz";
                  }
                });
              }
            },
            label: Text("Hesapla"),
            icon: Icon(Icons.calculate),
          ),
          Text(yazi),
          Text(normallik),
        ],
      ),
    );
  }
}
