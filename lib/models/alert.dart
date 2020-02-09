
import 'package:cloud_firestore/cloud_firestore.dart';

class Alert {
  final String userId;
  final String description;
  final String location;
  final String imageURL;
  final DateTime createdAt;

  Alert(
      {this.createdAt,
      this.userId,
      this.description,
      this.location,
      this.imageURL});

  factory Alert.fromJson(Map<dynamic, dynamic> jsonMap) {
    print("jsonMap$jsonMap");
    return Alert(
      userId: (jsonMap['userId']),
      description: (jsonMap['description']??""),
      location: (jsonMap['location']??""),
      imageURL: (jsonMap['imageURL']??""),
      createdAt: (DateTime.fromMillisecondsSinceEpoch(jsonMap['createdAt']?? 0)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'description': description,
      'location': location,
      'imageURL': imageURL,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}
