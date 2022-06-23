import 'dart:ui';

import 'package:firebase_login/Create.dart';
import 'package:firebase_login/class/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool See=false;
  @override
  Widget build(BuildContext context) {
    TextEditingController Email_id = TextEditingController();
    TextEditingController Password = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 250,

              width: MediaQuery.of(context).size.height,
            child:   ClipPath(
              clipper: WaveClipperOne(reverse: false),
              child: Container(
                height: 120,
                color: Colors.greenAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.description,size: 50,color: Colors.white,),
                    SizedBox(
                      height: 10,
                    ),
                Text("Log In",style: TextStyle(fontSize: 65,fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),
              ),
            ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextField(
                        cursorHeight: 20,
                        controller: Email_id,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          // border: InputBorder.none,
                          hintText: 'abc123@gmail.com ',
                          label: Text("Email"),
                          // labelStyle: TextStyle(color: Colors.red),
                          floatingLabelStyle: TextStyle(color: Colors.teal),

                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextField(
                        cursorHeight: 20,
                        obscureText: See,
                        controller: Password,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          // border: InputBorder.none,
                          hintText: 'enter password ',
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (See == false) {
                                setState(() {
                                  See = true;
                                });
                              }
                              else if(See==true){
                                setState(() {
                                  See=false;
                                });
                              }
                            },
                            icon: See==false?Icon(Icons.visibility):Icon(Icons.visibility_off),
                          ),
                          label: Text("Password"),
                          // labelStyle: TextStyle(color: Colors.red),
                          floatingLabelStyle: TextStyle(color: Colors.teal),

                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),


                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Icon(Icons.lock),),);
                     Auth().Login(Email_id.text, Password.text, context);
                    },
                    child: Container(
                      height: 50,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(
                        child: Text("Log In",style: TextStyle(fontSize: 25,color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Accounte? ",style: TextStyle(fontSize: 15,color: Colors.black),),
                      InkWell(
                        onTap: (){
                       Navigator.pushNamed(context,  'Create');
                        },
                          child: Text("Sign Up",style: TextStyle(fontSize: 15,color: Colors.green),)),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
