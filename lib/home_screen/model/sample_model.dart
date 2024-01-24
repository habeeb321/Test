// To parse this JSON data, do
//
//     final sampleModel = sampleModelFromJson(jsonString);

import 'dart:convert';

List<SampleModel> sampleModelFromJson(String str) => List<SampleModel>.from(
    json.decode(str).map((x) => SampleModel.fromJson(x)));

String sampleModelToJson(List<SampleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleModel {
  int? id;
  String? name;
  String? company;

  SampleModel({
    this.id,
    this.name,
    this.company,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
        id: json["id"],
        name: json["name"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "company": company,
      };
}
