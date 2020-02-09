import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String accountType;

  User({
    this.uid,
    this.username,
    this.email,
    this.accountType,
  });

  factory User.fromDoc(DocumentSnapshot snapshot) {
    User user = User.fromJson(snapshot.data);
    return User(
      uid: snapshot.documentID,
      username: user.username,
      email: user.email,
      accountType: user.accountType,
    );
  }

factory User.fromData(DataSnapshot snapshot) {
  print("snapshopp${snapshot.value}");
    User user = User.fromJson(snapshot.value);
    print("fromData$user");
    return User(
      uid: snapshot.value,
      username: user.username,
      email: user.email,
      accountType: user.accountType,
    );
  }
  
  factory User.fromJson(Map<dynamic, dynamic> jsonMap) {
    print("jsonMap$jsonMap");
    return User(
      uid: (jsonMap['uid']),
      username: (jsonMap['username']),
      email: (jsonMap['email']),
      accountType: (jsonMap['accountType']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'accountType': accountType,
    };
  }
}
