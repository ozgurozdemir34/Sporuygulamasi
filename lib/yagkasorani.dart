import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("yagkasorani");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kilo Takibi',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Yagkasorani(),
    );
  }
}

class Yagkasorani extends StatefulWidget {
  const Yagkasorani({Key? key}) : super(key: key);

  @override
  _YagkasoraniState createState() => _YagkasoraniState();
}

class _YagkasoraniState extends State<Yagkasorani> {
  TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            int sayi = (Hive.box("yagkasorani").length ~/ 2) + 1;
            setState(() {
              var gun = DateTime.now().day;
              var ay = DateTime.now().month;
              var yil = DateTime.now().year;
              if (_textFieldController.text != "") {
                Hive.box("yagkasorani").put(
                    "$gun.$ay.$yil tarihli $sayi. Ölçümün Yağ Oranı ",
                    int.parse(_textFieldController.text));
                Hive.box("yagkasorani").put(
                    "$gun.$ay.$yil tarihli $sayi. Ölçümün Kas Oranı ",
                    100 - int.parse(_textFieldController.text));
                _textFieldController.clear();
              }
            });
          }
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text("YAĞ KAS ORANI TAKİBİ"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 231, 31, 31),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: _buildListOrLoading(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _textFieldController,
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
                  hintText: 'Yağ oranınızı giriniz',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListOrLoading() {
    return FutureBuilder(
      future: _checkAndOpenBox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: Hive.box("yagkasorani").length,
            itemBuilder: (context, index) {
              var key = Hive.box("yagkasorani").keyAt(index);
              var value = Hive.box("yagkasorani").get(key);
              return ListTile(
                title: Text('$key: $value'),
              );
            },
          );
        }
      },
    );
  }

  Future<void> _checkAndOpenBox() async {
    if (!Hive.isBoxOpen("yagkasorani")) {
      await Hive.openBox("yagkasorani");
    }
  }
}
