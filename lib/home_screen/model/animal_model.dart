// To parse this JSON data, do
//
//     final animalModel = animalModelFromJson(jsonString);

import 'dart:convert';

List<AnimalModel> animalModelFromJson(String str) => List<AnimalModel>.from(
    json.decode(str).map((x) => AnimalModel.fromJson(x)));

String animalModelToJson(List<AnimalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimalModel {
  String? api;
  String? description;
  String? auth;
  bool? https;
  String? cors;
  String? link;
  String? category;

  AnimalModel({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.category,
  });

  factory AnimalModel.fromJson(Map<String, dynamic> json) => AnimalModel(
        api: json["API"],
        description: json["Description"],
        auth: json["Auth"],
        https: json["HTTPS"],
        cors: json["Cors"],
        link: json["Link"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "API": api,
        "Description": description,
        "Auth": auth,
        "HTTPS": https,
        "Cors": cors,
        "Link": link,
        "Category": category,
      };
}
