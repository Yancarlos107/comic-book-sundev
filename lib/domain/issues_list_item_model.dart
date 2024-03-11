import 'dart:convert';

import 'package:comic_book/domain/domains.dart';

class IsuessListItemModel {
  dynamic aliases;
  String apiDetailUrl;
  DateTime coverDate;
  DateTime dateAdded;
  DateTime dateLastUpdated;
  dynamic deck;
  String? description;
  bool hasStaffReview;
  int id;
  ImageIssue image;
  List<AssociatedImage> associatedImages;
  String issueNumber;
  String? name;
  String siteDetailUrl;
  DateTime? storeDate;
  Volume volume;

  IsuessListItemModel({
    required this.aliases,
    required this.apiDetailUrl,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.associatedImages,
    required this.issueNumber,
    required this.name,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.volume,
  });

  factory IsuessListItemModel.fromJson(String str) =>
      IsuessListItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IsuessListItemModel.fromMap(Map<String, dynamic> json) =>
      IsuessListItemModel(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        coverDate: DateTime.parse(json["cover_date"]),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: ImageIssue.fromMap(json["image"]),
        associatedImages: List<AssociatedImage>.from(
            json["associated_images"].map((x) => AssociatedImage.fromMap(x))),
        issueNumber: json["issue_number"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"] == null
            ? null
            : DateTime.parse(json["store_date"]),
        volume: Volume.fromMap(json["volume"]),
      );

  Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "cover_date":
            "${coverDate.year.toString().padLeft(4, '0')}-${coverDate.month.toString().padLeft(2, '0')}-${coverDate.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "deck": deck,
        "description": description,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image.toMap(),
        "associated_images":
            List<dynamic>.from(associatedImages.map((x) => x.toMap())),
        "issue_number": issueNumber,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "store_date":
            "${storeDate!.year.toString().padLeft(4, '0')}-${storeDate!.month.toString().padLeft(2, '0')}-${storeDate!.day.toString().padLeft(2, '0')}",
        "volume": volume.toMap(),
      };
}
