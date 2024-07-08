import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Gunlukprotein extends StatefulWidget {
  @override
  _GunlukproteinState createState() => _GunlukproteinState();
}

class _GunlukproteinState extends State<Gunlukprotein> {
  final TextEditingController kilocontroller = TextEditingController();
  String? amac;
  String yazi = "";
  double altsinir = 0;
  double ustsinir = 0;
  double altsonuc = 0;
  double ustsonuc = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "GÜNLÜK PROTEİN İHTİYACI HESAPLAMA",
        ),
        backgroundColor: Color.fromARGB(255, 231, 31, 31),
      ),
      body: Column(
        children: [
          TextField(
            controller: kilocontroller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(hintText: "Kilonuzu giriniz(KG)"),
          ),
          DropdownButton<String>(
            hint: Text("Amacınız"),
            value: amac,
            items: [
              DropdownMenuItem(
                child: Text("Kas Yapmak"),
                value: "Kas Yapmak",
              ),
              DropdownMenuItem(
                child: Text("Dayanıklılık Sporları"),
                value: "Dayanıklılık",
              ),
              DropdownMenuItem(
                child: Text("Aktif Spor"),
                value: "Aktif Spor",
              ),
              DropdownMenuItem(
                child: Text("Kas Oranını Korumak"),
                value: "Oran Koruma",
              ),
              DropdownMenuItem(
                child: Text("Yağ Azaltma"),
                value: "Yağ Azaltma",
              ),
              DropdownMenuItem(
                child: Text("Düşük Kalori"),
                value: "Düşük Kalori",
              ),
            ],
            onChanged: (value) {
              setState(() {
                amac = value;
              });
            },
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (kilocontroller.text.isEmpty || amac == null) {
                setState(() {
                  yazi =
                      "Lütfen bütün alanları seçip yazdığınızdan emin olunuz";
                });
              } else {
                if (amac == "Kas Yapmak") {
                  setState(() {
                    altsinir = 1.4;
                    ustsinir = 1.8;
                  });
                } else if (amac == "Dayanıklılık") {
                  setState(() {
                    altsinir = 1.2;
                    ustsinir = 1.4;
                  });
                } else if (amac == "Aktif Spor") {
                  setState(() {
                    altsinir = 1.4;
                    ustsinir = 2;
                  });
                } else if (amac == "Düşük Kalori") {
                  setState(() {
                    altsinir = 1.0;
                    ustsinir = 1.8;
                  });
                } else if (amac == "Oran Koruma") {
                  setState(() {
                    altsinir = 1.0;
                    ustsinir = 1.5;
                  });
                } else if (amac == "Yağ Azaltma") {
                  setState(() {
                    altsinir = 1.0;
                    ustsinir = 1.8;
                  });
                }

                setState(() {
                  altsonuc = double.parse(kilocontroller.text) * altsinir;
                  ustsonuc = double.parse(kilocontroller.text) * ustsinir;
                  yazi =
                      "Günlük almanız gereken alt sınır: ${altsonuc.toInt()}\nGünlük almanız gereken üst sınır: ${ustsonuc.toInt()}";
                });
              }
            },
            label: Text("Hesapla"),
            icon: Icon(Icons.calculate),
          ),
          Text(yazi),
        ],
      ),
    );
  }
}
