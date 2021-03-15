// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

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
  List<Item> items;
  int limit;
  String next;
  int offset;
  dynamic previous;
  int total;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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

class Item {
  Item({
    this.href,
    this.icons,
    this.id,
    this.name,
  });

  String href;
  List<Icon> icons;
  String id;
  String name;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        href: json["href"],
        icons: List<Icon>.from(json["icons"].map((x) => Icon.fromJson(x))),
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

class Icon {
  Icon({
    this.height,
    this.url,
    this.width,
  });

  int height;
  String url;
  int width;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}
