import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_api_consumer/models/spotify/album.dart';
import 'dart:convert' as convert;

import 'package:spotify_api_consumer/models/spotify/albums_response.dart';
import 'package:spotify_api_consumer/utils/constants.dart';

class AlbumsProvider extends ChangeNotifier {
  List<Album> _albums = [];
  Album _album;

  AlbumsProvider.instance() {
    fetchNewReleases();
  }

  List<Album> get items => _albums;

  set items(List<Album> value) {
    _albums = value;
    notifyListeners();
  }

  Future<void> fetchNewReleases() async {
    var url = Uri.https(
      'api.spotify.com',
      '/v1/browse/new-releases',
      {
        'country': 'CO',
        'locale': 'es-CO',
      },
    );

    try {
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': SpotifyConstants.auth
      });
      print(response.body);
      if (response.statusCode == 200) {
        final json = convert.jsonDecode(response.body);

        final itemsContainer = NewReleasesResponse.fromJson(json["albums"]);

        items = itemsContainer.items;
      }
    } catch (e) {
      print(e);
    }
  }
}
