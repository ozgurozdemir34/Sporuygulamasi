import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sporuygulamasi/endeks.dart';
import 'package:sporuygulamasi/gunlukkalori.dart';
import 'package:sporuygulamasi/gunlukprotein.dart';


class Hesaplamalar extends StatelessWidget {
  const Hesaplamalar({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "HESAPLAMA",
        ),
        backgroundColor: Color.fromARGB(255, 231, 31, 31),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gunlukkalori()));
              },
              child: Text("Günlük Kalori İhtiyacı Hesaplama")),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Gunlukprotein()));
              },
              child: Text("Günlük Protein İhtiyacı Hesaplama")),
          SizedBox(
            height: 50,
          ),
           ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Endeks()));
              },
              child: Text("Vücut Kitle Endeksi Hesaplama")),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
