import 'package:firebase_login/class/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  bool See = false;
  TextEditingController Email_id = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              child: Container(
                height: 200,

                width: MediaQuery.of(context).size.height,
                child:   ClipPath(
                  clipper: WaveClipperOne(reverse: false),
                  child: Container(
                    height: 100,
                    color: Colors.greenAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.description,size: 50,color: Colors.white,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Create Accounte",style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Card(
              child: Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(6)),
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
            ),
            SizedBox(height: 10,),
            Card(
              child: Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(6)),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextField(
                    cursorHeight: 20,
                    controller: Password,
                    obscureText: See,
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
                          } else if (See == true) {
                            setState(() {
                              See = false;
                            });
                          }
                        },
                        icon: See == false
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
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
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: (){
                Auth().create_Accounte(Email_id.text, Password.text,context);
              },
              child: Card(

                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade700,
                  borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child:Text("Sign up",style: TextStyle(
                      fontSize: 20,color: Colors.white
                    ),),
                  ),
                ),
              ),
            ),
           SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
