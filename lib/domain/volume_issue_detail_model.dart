import 'dart:convert';

class VolumeIssueDetail {
  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;
  String? role;

  VolumeIssueDetail({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
    this.role,
  });

  factory VolumeIssueDetail.fromJson(String str) =>
      VolumeIssueDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VolumeIssueDetail.fromMap(Map<String, dynamic> json) =>
      VolumeIssueDetail(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "role": role,
      };
}
