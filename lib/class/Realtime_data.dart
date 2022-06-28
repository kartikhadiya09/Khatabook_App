import 'package:firebase_database/firebase_database.dart';

class Realtime {
  FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  DatabaseReference? dbref;

  void Adddata(String b1) {
    dbref = _firebaseDatabase.ref();
    dbref!.child("Work").push().set({"body": "$b1","check":false});
  }


  Stream<DatabaseEvent> Readdata(){
    dbref = _firebaseDatabase.ref();
    return  dbref!.child("Work").onValue;
  }

  void Delitedata(String key){
    dbref = _firebaseDatabase.ref();
    dbref!.child("Work").child("$key").remove();
  }

  void Updatedata(String b1, String key){
    dbref = _firebaseDatabase.ref();
    dbref!.child("Work").child(key).set({"body":b1,"check":false});
  }
  void updatechek(String b1, String key){
    dbref = _firebaseDatabase.ref();
    dbref!.child("Work").child(key).set({"body":b1,"check":true});
  }
}
