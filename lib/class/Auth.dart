import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/Home.dart';
import 'package:firebase_login/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  void create_Accounte(String email, String password,BuildContext context ) {
    auth.createUserWithEmailAndPassword(email: email, password: password).whenComplete(() => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home())));
  }

  void Login(String email, String password, BuildContext context) async {
    try {
      var data = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("user not found please sing up"),
          backgroundColor: Colors.pinkAccent,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('password wrong please sing up'),
          backgroundColor: Colors.pinkAccent,
        ));
      }
    }
  }

  bool Chek_curent_User(BuildContext context) {
    if (auth.currentUser != null) {
      //login user
      return true;
    } else {
      //login faild
      return false;
    }
  }

  void SingOut(BuildContext context) {
    auth.signOut().whenComplete(() => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Splash())));
  }
}
