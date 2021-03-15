// To parse this JSON data, do
//
//     final newReleasesResponse = newReleasesResponseFromJson(jsonString);

import 'dart:convert';

import 'album.dart';

NewReleasesResponse newReleasesResponseFromJson(String str) =>
    NewReleasesResponse.fromJson(json.decode(str));

String newReleasesResponseToJson(NewReleasesResponse data) =>
    json.encode(data.toJson());

class NewReleasesResponse {
  NewReleasesResponse({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  String href;
  List<Album> items;
  int limit;
  String next;
  int offset;
  dynamic previous;
  int total;

  factory NewReleasesResponse.fromJson(Map<String, dynamic> json) =>
      NewReleasesResponse(
        href: json["href"],
        items: List<Album>.from(json["items"].map((x) => Album.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

enum ReleaseDatePrecision { DAY }

final releaseDatePrecisionValues =
    EnumValues({"day": ReleaseDatePrecision.DAY});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
