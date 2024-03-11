import 'dart:convert';

import 'package:comic_book/domain/domains.dart';

class IssueDetail {
  dynamic aliases;
  String apiDetailUrl;
  List<AssociatedImage> associatedImages;
  List<VolumeIssueDetail> characterCredits;
  List<dynamic> characterDiedIn;
  List<VolumeIssueDetail> conceptCredits;
  DateTime coverDate;
  DateTime dateAdded;
  DateTime dateLastUpdated;
  dynamic deck;
  String description;
  dynamic firstAppearanceCharacters;
  dynamic firstAppearanceConcepts;
  dynamic firstAppearanceLocations;
  dynamic firstAppearanceObjects;
  dynamic firstAppearanceStoryarcs;
  dynamic firstAppearanceTeams;
  bool hasStaffReview;
  int id;
  ImageIssue image;
  String issueNumber;
  List<VolumeIssueDetail> locationCredits;
  String name;
  List<dynamic> objectCredits;
  List<VolumeIssueDetail> personCredits;
  String siteDetailUrl;
  dynamic storeDate;
  List<dynamic> storyArcCredits;
  List<dynamic> teamCredits;
  List<dynamic> teamDisbandedIn;
  VolumeIssueDetail volume;

  IssueDetail({
    required this.aliases,
    required this.apiDetailUrl,
    required this.associatedImages,
    required this.characterCredits,
    required this.characterDiedIn,
    required this.conceptCredits,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.firstAppearanceCharacters,
    required this.firstAppearanceConcepts,
    required this.firstAppearanceLocations,
    required this.firstAppearanceObjects,
    required this.firstAppearanceStoryarcs,
    required this.firstAppearanceTeams,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.issueNumber,
    required this.locationCredits,
    required this.name,
    required this.objectCredits,
    required this.personCredits,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.storyArcCredits,
    required this.teamCredits,
    required this.teamDisbandedIn,
    required this.volume,
  });

  factory IssueDetail.fromJson(String str) =>
      IssueDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IssueDetail.fromMap(Map<String, dynamic> json) => IssueDetail(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        associatedImages: List<AssociatedImage>.from(
            json["associated_images"].map((x) => AssociatedImage.fromMap(x))),
        characterCredits: List<VolumeIssueDetail>.from(
            json["character_credits"].map((x) => VolumeIssueDetail.fromMap(x))),
        characterDiedIn:
            List<dynamic>.from(json["character_died_in"].map((x) => x)),
        conceptCredits: List<VolumeIssueDetail>.from(
            json["concept_credits"].map((x) => VolumeIssueDetail.fromMap(x))),
        coverDate: DateTime.parse(json["cover_date"]),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        firstAppearanceCharacters: json["first_appearance_characters"],
        firstAppearanceConcepts: json["first_appearance_concepts"],
        firstAppearanceLocations: json["first_appearance_locations"],
        firstAppearanceObjects: json["first_appearance_objects"],
        firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
        firstAppearanceTeams: json["first_appearance_teams"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: ImageIssue.fromMap(json["image"]),
        issueNumber: json["issue_number"],
        locationCredits: List<VolumeIssueDetail>.from(
            json["location_credits"].map((x) => VolumeIssueDetail.fromMap(x))),
        name: json["name"],
        objectCredits: List<dynamic>.from(json["object_credits"].map((x) => x)),
        personCredits: List<VolumeIssueDetail>.from(
            json["person_credits"].map((x) => VolumeIssueDetail.fromMap(x))),
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"],
        storyArcCredits:
            List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
        teamCredits: List<dynamic>.from(json["team_credits"].map((x) => x)),
        teamDisbandedIn:
            List<dynamic>.from(json["team_disbanded_in"].map((x) => x)),
        volume: VolumeIssueDetail.fromMap(json["volume"]),
      );

  Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "associated_images":
            List<dynamic>.from(associatedImages.map((x) => x.toMap())),
        "character_credits":
            List<dynamic>.from(characterCredits.map((x) => x.toMap())),
        "character_died_in": List<dynamic>.from(characterDiedIn.map((x) => x)),
        "concept_credits":
            List<dynamic>.from(conceptCredits.map((x) => x.toMap())),
        "cover_date":
            "${coverDate.year.toString().padLeft(4, '0')}-${coverDate.month.toString().padLeft(2, '0')}-${coverDate.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appearance_characters": firstAppearanceCharacters,
        "first_appearance_concepts": firstAppearanceConcepts,
        "first_appearance_locations": firstAppearanceLocations,
        "first_appearance_objects": firstAppearanceObjects,
        "first_appearance_storyarcs": firstAppearanceStoryarcs,
        "first_appearance_teams": firstAppearanceTeams,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image.toMap(),
        "issue_number": issueNumber,
        "location_credits":
            List<dynamic>.from(locationCredits.map((x) => x.toMap())),
        "name": name,
        "object_credits": List<dynamic>.from(objectCredits.map((x) => x)),
        "person_credits":
            List<dynamic>.from(personCredits.map((x) => x.toMap())),
        "site_detail_url": siteDetailUrl,
        "store_date": storeDate,
        "story_arc_credits": List<dynamic>.from(storyArcCredits.map((x) => x)),
        "team_credits": List<dynamic>.from(teamCredits.map((x) => x)),
        "team_disbanded_in": List<dynamic>.from(teamDisbandedIn.map((x) => x)),
        "volume": volume.toMap(),
      };
}
