// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

import 'spotify_image.dart';

CategoriesResponse categoriesResponseFromJson(String str) =>
    CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) =>
    json.encode(data.toJson());

class CategoriesResponse {
  CategoriesResponse({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  String href;
  List<Category> items;
  int limit;
  String next;
  int offset;
  dynamic previous;
  int total;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        href: json["href"],
        items:
            List<Category>.from(json["items"].map((x) => Category.fromJson(x))),
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

class Category {
  Category({
    this.href,
    this.icons,
    this.id,
    this.name,
  });

  String href;
  List<SpotifyImage> icons;
  String id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        href: json["href"],
        icons: List<SpotifyImage>.from(
            json["icons"].map((x) => SpotifyImage.fromJson(x))),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "icons": List<dynamic>.from(icons.map((x) => x.toJson())),
        "id": id,
        "name": name,
      };
}
