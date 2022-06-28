import 'package:firebase_login/class/Global_controlar.dart';
import 'package:firebase_login/class/Realtime_data.dart';
import 'package:flutter/material.dart';

class Add_data extends StatefulWidget {
  const Add_data({Key? key}) : super(key: key);

  @override
  State<Add_data> createState() => _Add_dataState();
}

class _Add_dataState extends State<Add_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        title: Text("Add_Data"),
      ),
      body: Card(
        color: Colors.tealAccent.shade100,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  maxLength: 40,
                  controller: global.body,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Body',
                    hintText: 'About',
                    suffixIcon: Icon(Icons.abc_outlined),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Realtime().Adddata(global.body.text);
                    Navigator.pop(context);
                  },
                  child: Text("ADD_DATA"),
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
