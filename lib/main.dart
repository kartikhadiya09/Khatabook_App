import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/Add_data.dart';
import 'package:firebase_login/Create.dart';
import 'package:firebase_login/Home.dart';
import 'package:firebase_login/Login.dart';
import 'package:firebase_login/class/Auth.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => () {});

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Splash(),
        'Login':(context)=>Login(),
        'Create':(context)=>SingIn_page(),
        'Home':(context)=>Home(),
        'Add_data':(context)=>Add_data(),
      },
    )
  );
}


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Timer(Duration(seconds: 3),()=>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login())),);
  }
  @override
  Widget build(BuildContext context) {
    chek();
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.description,size: 80,color: Colors.white,),
            SizedBox(height: 15,),
            Text("Note Keeper",style: TextStyle(fontSize: 35,letterSpacing: 1,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }

  void chek() {
    if (Auth().Chek_curent_User(context) == true) {
      Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        ),
      );
    } else {
      Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        ),
      );
    }
  }
}


