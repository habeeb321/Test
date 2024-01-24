// To parse this JSON data, do
//
//     final bpiModel = bpiModelFromJson(jsonString);

import 'dart:convert';

BpiModel bpiModelFromJson(String str) => BpiModel.fromJson(json.decode(str));

String bpiModelToJson(BpiModel data) => json.encode(data.toJson());

class BpiModel {
  int? total;
  int? limit;
  int? offset;
  int? totalPages;
  int? currentPage;

  BpiModel({
    this.total,
    this.limit,
    this.offset,
    this.totalPages,
    this.currentPage,
  });

  factory BpiModel.fromJson(Map<String, dynamic> json) => BpiModel(
        total: json["total"],
        limit: json["limit"],
        offset: json["offset"],
        totalPages: json["total_pages"],
        currentPage: json["current_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "offset": offset,
        "total_pages": totalPages,
        "current_page": currentPage,
      };
}
