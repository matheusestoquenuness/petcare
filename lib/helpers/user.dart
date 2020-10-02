import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    this.name,
    this.email,
    this.passowrd,
    this.id,
  });
  String id;
  String name;
  String email;
  String passowrd;

  String confirmpassword;

  DocumentReference get FirestoreRef =>
      Firestore.instance.document('users/$id');
  Future<void> saveDate() async {
    await FirestoreRef.setData({
      'name': name,
      'email': email,
    });
  }
}
