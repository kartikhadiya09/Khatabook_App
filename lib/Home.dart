import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/class/Auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Home"),
      ),
      body: Card(
        color: Colors.pinkAccent.shade100,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Card(
                color: Colors.pink,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    "Email :- ${auth.currentUser!.email}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              Card(
                color: Colors.pink,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    "UID :- ${auth.currentUser!.uid}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              Expanded(
                child: Card(),
              ),
              InkWell(
                onTap: (){
                  Auth().SingOut(context);
                },
                child: Card(
                  color: Colors.pink,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      "Sing Out",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
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
