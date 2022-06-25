import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/class/Auth.dart';
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
  bool work = true;

  @override
  Widget build(BuildContext context) {
    bool value= false;
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
            child: Card(
              color: Colors.white,

              child: Container(
                height: 50,
                width: 50,
                
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "0               ",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
                              fontSize: 30, fontWeight: FontWeight.bold),
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
              Card(
                color: Colors.teal,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Radio(value:work, groupValue: "", onChanged: (value){
                        setState(() {

                        });
                      }),
                      Text("Pake a truash out ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                      Icon(Icons.edit),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
