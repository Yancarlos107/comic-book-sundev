// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:comic_book/domain/domains.dart';

class AssociatedImage {
  String originalUrl;
  int id;
  dynamic caption;
  ImageTags imageTags;

  AssociatedImage({
    required this.originalUrl,
    required this.id,
    required this.caption,
    required this.imageTags,
  });

  factory AssociatedImage.fromJson(String str) =>
      AssociatedImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AssociatedImage.fromMap(Map<String, dynamic> json) => AssociatedImage(
        originalUrl: json["original_url"],
        id: json["id"],
        caption: json["caption"],
        imageTags: imageTagsValues.map[json["image_tags"]]!,
      );

  Map<String, dynamic> toMap() => {
        "original_url": originalUrl,
        "id": id,
        "caption": caption,
        "image_tags": imageTagsValues.reverse[imageTags],
      };
}

enum ImageTags { ALL_IMAGES }

final imageTagsValues = EnumValues({"All Images": ImageTags.ALL_IMAGES});
