import 'dart:convert';

import 'person.dart';
import 'track.dart';

PlaylistDetailsResponse playlistDetailsResponseFromJson(String str) =>
    PlaylistDetailsResponse.fromJson(json.decode(str));

String playlistDetailsResponseToJson(PlaylistDetailsResponse data) =>
    json.encode(data.toJson());

class PlaylistDetailsResponse {
  PlaylistDetailsResponse({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  String href;
  List<PlaylistTrack> items;
  int limit;
  String next;
  int offset;
  dynamic previous;
  int total;

  factory PlaylistDetailsResponse.fromJson(Map<String, dynamic> json) =>
      PlaylistDetailsResponse(
        href: json["href"],
        items: List<PlaylistTrack>.from(
            json["items"].map((x) => PlaylistTrack.fromJson(x))),
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

class PlaylistTrack {
  PlaylistTrack({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  DateTime addedAt;
  Person addedBy;
  bool isLocal;
  dynamic primaryColor;
  Track track;
  VideoThumbnail videoThumbnail;

  factory PlaylistTrack.fromJson(Map<String, dynamic> json) => PlaylistTrack(
        addedAt: DateTime.parse(json["added_at"]),
        addedBy: Person.fromJson(json["added_by"]),
        isLocal: json["is_local"],
        primaryColor: json["primary_color"],
        track: Track.fromJson(json["track"]),
        videoThumbnail: VideoThumbnail.fromJson(json["video_thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "added_at": addedAt.toIso8601String(),
        "added_by": addedBy.toJson(),
        "is_local": isLocal,
        "primary_color": primaryColor,
        "track": track.toJson(),
        "video_thumbnail": videoThumbnail.toJson(),
      };
}

class VideoThumbnail {
  VideoThumbnail({
    this.url,
  });

  dynamic url;

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

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
