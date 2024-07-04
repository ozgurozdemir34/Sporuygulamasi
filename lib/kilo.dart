import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class Kilo extends StatefulWidget {
  const Kilo({Key? key}) : super(key: key);

  @override
  KiloState createState() => KiloState();
}

class KiloState extends State<Kilo> {
  late Box kiloBox;
  TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); 

  @override
  void initState() {
    super.initState();
    openBoxAndFetchData();
  }

  Future<void> openBoxAndFetchData() async {
    await Hive.initFlutter();
    kiloBox = await Hive.openBox("Kilo");
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            int sayi = kiloBox.length + 1;
            setState(() {
              if(_textFieldController.text!=""){
               kiloBox.put("Kilo$sayi", int.parse(_textFieldController.text));
              _textFieldController.clear();
              }
              
            });
          }
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("KİLO TAKİBİ"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: kiloBox.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: kiloBox.length,
                      itemBuilder: (context, index) {
                        var key = kiloBox.keyAt(index);
                        var value = kiloBox.get(key);
                        return ListTile(
                          title: Text('Index $index: $value'),
                        );
                      },
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                hintText: 'Kilonuzu giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
