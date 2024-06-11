import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sporuygulamasi/salonhakkinda.dart';

class Anasayfa extends StatelessWidget {
  const Anasayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              title: (Text("Ana Sayfa")),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Salonhakkinda()));
              },
              title: Text("Salon Hakkında"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Salon Paketleri"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Antrenörler"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Bildirimler"),
            )
          ],
        ),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.qr_code),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Spor Salonu Ugulaması",
        ),
        backgroundColor: Colors.lightBlue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank), label: "Diyet Programı"),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_sharp), label: "Antreman"),
          BottomNavigationBarItem(
              icon: Icon(Icons.height), label: "Boy Ölçümü"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight), label: "Kilo Ölçümü"),
        ],
      ),
      body: Column(children: [
        SizedBox(
          width: 200,
          height: 200,
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.date_range_rounded),
            label: Text("Deneme"),
            style: ElevatedButton.styleFrom(
                textStyle:
                    TextStyle(fontFamily: ChannelBuffers.kControlChannelName))),
        SizedBox()
      ]),
    );
  }
}

class Butonlar {
  static BoxDecoration stillendirme = BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.all(Radius.circular(15)));
}
