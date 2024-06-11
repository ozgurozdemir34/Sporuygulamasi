import 'package:flutter/material.dart';

class Salonhakkinda extends StatelessWidget {
  final String yazi = "Örnek";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Salon Hakkında",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Text("Salon Adı:$yazi")],
      ),
    );
  }
}
