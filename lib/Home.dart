

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_login/class/Auth.dart';
import 'package:firebase_login/class/Global_controlar.dart';
import 'package:firebase_login/class/Modal_class.dart';
import 'package:firebase_login/class/Realtime_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var dt = DateTime.now();
  String realtz = DateFormat("EEEEE , dd , yyyy").format(DateTime.now());
  bool work = false;
  List<FriModal> l1 = [];

  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Auth().SingOut(context);
          },
          child: Icon(Icons.logout),
        ),
        backgroundColor: Colors.teal.shade700,
        title: Text("Home"),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'Add_data');
              },
              child: Card(
                color: Colors.white,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.teal,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Card(
        color: Colors.tealAccent.shade100,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Card(
                color: Colors.teal,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    " ${realtz}",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: Realtime().Readdata(),
                    builder: (context, AsyncSnapshot snapshot) {
                      l1.clear();
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        DataSnapshot snap = snapshot.data.snapshot;

                        for (DataSnapshot sp in snap.children) {
                          String body = sp.child("body").value.toString();
                          dynamic check = sp.child("check").value as bool ;

                          String? key = sp.key;
                          FriModal fireModal = FriModal(body, key!,check);
                          l1.add(fireModal);
                        }
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${l1.length}               ",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Created tasks",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "                 0",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Completed tasks",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: l1.length,
                                itemBuilder: (context, indext) {
                                  return Card(
                                    color: Colors.teal,
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      child: Row(
                                        children: [
                                          Checkbox(value:l1[indext].check, onChanged: (value){

                                          setState(() {
                                            l1[indext].check==true? l1[indext].check=false: l1[indext].check=true;
                                            Realtime().updatechek(l1[indext].key,l1[indext].body);
                                            Realtime().Updatedata(l1[indext].body, l1[indext].key);
                                          });
                                      }),
                                          SizedBox(width: 10,),
                                          Text(
                                            "${l1[indext].body}",
                                           // style: global.textstle(),
                                          ),
                                          Expanded(child: Container()),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                global.body.text=l1[indext].body;

                                              });
                                              updateDialog(l1[indext].key);
                                            },
                                            icon: Icon(Icons.edit),
                                          ),
                                          SizedBox(width: 20,),
                                          IconButton(
                                            onPressed: () {
                                              Delit(l1[indext].key);
                                            },
                                            icon: Icon(Icons.delete),
                                          ),
                                        ],
                                        
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }

                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void updateDialog(String key) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Stack(
                children: [
                  Container(
                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                            maxLength: 40,
                            controller: global.body,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Photo',
                              hintText: 'Link',
                              suffixIcon: Icon(Icons.update),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Realtime().Updatedata(
                                 global.body.text, key);
                              Navigator.pop(context);
                            },
                            child: Text("Update"))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }


  void Delit(String key) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "ALEART",
              style: TextStyle(color: Colors.red),
            ),
            actions: [
              Container(
                child: Column(
                  children: [
                    Center(child: Text("ARE  YOU  SURE ?")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              // RealTime().deliteNews(key);
                              Navigator.pop(context);
                            },
                            child: Text("NO"),
                            style: TextButton.styleFrom(primary: Colors.green),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Realtime().Delitedata(key);
                              Navigator.pop(context);
                            },
                            child: Text("YAS"),
                            style: TextButton.styleFrom(primary: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
