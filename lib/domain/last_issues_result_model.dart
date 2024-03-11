import 'dart:convert';

import 'package:comic_book/domain/domains.dart';

class LastIssuesModel {
  String error;
  int limit;
  int offset;
  int numberOfPageResults;
  int numberOfTotalResults;
  int statusCode;
  List<IsuessListItemModel> results;
  String version;

  LastIssuesModel({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  factory LastIssuesModel.fromJson(String str) =>
      LastIssuesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LastIssuesModel.fromMap(Map<String, dynamic> json) => LastIssuesModel(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: List<IsuessListItemModel>.from(
            json["results"].map((x) => IsuessListItemModel.fromMap(x))),
        version: json["version"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "version": version,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
