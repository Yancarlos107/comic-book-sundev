import 'dart:convert';

import 'package:comic_book/domain/domains.dart';

class IssueDetailResult {
  String error;
  int limit;
  int offset;
  int numberOfPageResults;
  int numberOfTotalResults;
  int statusCode;
  IssueDetail? results;
  String version;

  IssueDetailResult({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  factory IssueDetailResult.fromJson(String str) =>
      IssueDetailResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IssueDetailResult.fromMap(Map<String, dynamic> json) =>
      IssueDetailResult(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: IssueDetail.fromMap(json["results"]),
        version: json["version"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results?.toMap(),
        "version": version,
      };
}
