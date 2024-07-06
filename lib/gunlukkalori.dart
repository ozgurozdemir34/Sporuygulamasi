import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Gunlukkalori extends StatefulWidget {
  @override
  _Gunlukkalori createState() => _Gunlukkalori();
}

class _Gunlukkalori extends State<Gunlukkalori> {
  final TextEditingController kilocontroller = TextEditingController();
  final TextEditingController boycontroller = TextEditingController();
  final TextEditingController yascontroller = TextEditingController();
  double bhm = 0;
  double sonuc = 0;
  String yazi = "";
  String? cinsiyet;
  String? hareket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "GÜNLÜK KALORİ İHTİYACI HESAPLAMA",
        ),
        backgroundColor: Color.fromARGB(255, 231, 31, 31),
      ),
      body: Column(
        children: [
          TextField(
            controller: boycontroller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(hintText: "Boyunuzu giriniz(CM)"),
          ),
          TextField(
            controller: kilocontroller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(hintText: "Kilonuzu giriniz(KG)"),
          ),
          TextField(
            controller: yascontroller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(hintText: "Yaşınızı giriniz"),
          ),
          DropdownButton<String>(
            hint: Text("Cinsiyetiniz"),
            value: cinsiyet,
            items: [
              DropdownMenuItem(
                child: Text("Erkek"),
                value: "Erkek",
              ),
              DropdownMenuItem(
                child: Text("Kadın"),
                value: "Kadın",
              )
            ],
            onChanged: (value) {
              setState(() {
                cinsiyet = value;
              });
            },
          ),
          DropdownButton<String>(
            hint: Text("Hareket Durumunuz"),
            value: hareket,
            items: [
              DropdownMenuItem(
                child: Text("Durağan"),
                value: "Durağan",
              ),
              DropdownMenuItem(
                child: Text("Hafif Hareketli"),
                value: "Hafif",
              ),
              DropdownMenuItem(
                child: Text("Orta Hareketli"),
                value: "Orta",
              ),
              DropdownMenuItem(
                child: Text("Yüksek Hareketli"),
                value: "Yüksek",
              )
            ],
            onChanged: (value) {
              setState(() {
                hareket = value;
              });
            },
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                if (boycontroller.text.isEmpty ||
                    kilocontroller.text.isEmpty ||
                    yascontroller.text.isEmpty ||
                    cinsiyet == null ||
                    hareket == null) {
                  yazi =
                      "Lütfen bütün alanları seçip yazdığınızdan emin olunuz";
                } else {
                  double kilo = double.parse(kilocontroller.text);
                  double boy = double.parse(boycontroller.text);
                  double yas = double.parse(yascontroller.text);

                  if (cinsiyet == "Erkek") {
                    bhm = 66.47 + (13.75 * kilo) + (5 * boy) - (6.76 * yas);
                  } else if (cinsiyet == "Kadın") {
                    bhm = 665.1 + (9.56 * kilo) + (1.85 * boy) - (6.75 * yas);
                  }

                  switch (hareket) {
                    case "Durağan":
                      sonuc = bhm * 1.2;
                      break;
                    case "Hafif":
                      sonuc = bhm * 1.3;
                      break;
                    case "Orta":
                      sonuc = bhm * 1.4;
                      break;
                    case "Yüksek":
                      sonuc = bhm * 1.5;
                      break;
                  }
                  yazi =
                      "Günlük almanız gereken miktar:${sonuc.toInt()}"; // Convert result to integer
                }
              });
            },
            label: Text("Hesapla"),
            icon: Icon(Icons.calculate),
          ),
          Text(yazi)
        ],
      ),
    );
  }
}
