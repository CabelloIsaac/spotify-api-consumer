class SpotifyImage {
  SpotifyImage({
    this.height,
    this.url,
    this.width,
  });

  int height;
  String url;
  int width;

  factory SpotifyImage.fromJson(Map<String, dynamic> json) => SpotifyImage(
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
