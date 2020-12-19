// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

User usuarioFromJson(String str) => User.fromJson(json.decode(str));

String usuarioToJson(User data) => json.encode(data.toJson());

class User {
  User({this.online, this.username, this.email, this.uid});

  bool online;
  String username;
  String email;
  String uid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        online: json["online"],
        username: json["username"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "username": username,
        "email": email,
        "uid": uid,
      };
}
