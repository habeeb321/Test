// To parse this JSON data, do
//
//     final createUserModel = createUserModelFromJson(jsonString);

import 'dart:convert';

CreateUserModel createUserModelFromJson(String str) =>
    CreateUserModel.fromJson(json.decode(str));

String createUserModelToJson(CreateUserModel data) =>
    json.encode(data.toJson());

class CreateUserModel {
  String? email;
  String? password;
  String? id;
  DateTime? createdAt;

  CreateUserModel({
    this.email,
    this.password,
    this.id,
    this.createdAt,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      CreateUserModel(
        email: json["email"],
        password: json["password"],
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
      };
}
