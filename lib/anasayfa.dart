import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:sporuygulamasi/abonelik.dart';
import 'package:sporuygulamasi/boy.dart';
import 'package:sporuygulamasi/kilo.dart';
import 'package:sporuygulamasi/olcumler.dart';
import 'package:sporuygulamasi/salonhakkinda.dart';
import 'package:sporuygulamasi/suicme.dart';
import 'package:sporuygulamasi/yagkiloorani.dart';

class Anasayfa extends StatelessWidget {
  const Anasayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
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
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Olcumler()));
              },
              title: Text("Ölçümler"),
              
            ),
            ListTile(
              onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Yagkiloorani()));
              },
              title: Text("Yağ Kilo Oranı"),
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Spor Salonu Ugulaması",
        ),
        backgroundColor: Colors.lightBlue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        selectedLabelStyle: TextStyle(color: Colors.grey.shade500),
        selectedIconTheme: IconThemeData(color: Colors.grey.shade500),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dining), label: "Diyet Programı"),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_sharp), label: "Antreman"),
          BottomNavigationBarItem(
              icon: Icon(Icons.height), label: "Boy Ölçümü"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight), label: "Kilo Ölçümü"),
        ],
        onTap: (int index) {
          switch (index) {
            case 3:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Kilo()));

              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Boy()));
            default:
          }
        },
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: 400,
          height: 50,
        ),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Abonelik()));
          },
          icon: Icon(Icons.date_range_rounded),
          label: Text("Abonelik"),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Suicme()));
            },
            icon: Icon(Icons.water_drop_rounded),
            label: Text("Su İçme")),
        SizedBox(
          height: 50,
        ),
        ElevatedButton.icon(
            icon: Icon(Icons.leaderboard),
            onPressed: () {},
            label: Text("Rekorlar")),
        SizedBox(
          height: 50,
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.access_time),
            label: Text("Randevular")),
        SizedBox(
          height: 50,
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.group),
            label: Text("Grup Dersleri"))
      ]),
    );
  }
}

class Butonlar {
  static BoxDecoration stillendirme = BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.all(Radius.circular(15)));
}
