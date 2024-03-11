import 'dart:convert';

class Volume {
  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;

  Volume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
  });

  factory Volume.fromJson(String str) => Volume.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Volume.fromMap(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
      };
}
