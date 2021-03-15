import 'package:flutter/material.dart';
import 'package:spotify_api_consumer/models/spotify/categories_response.dart';
import 'package:spotify_api_consumer/models/spotify/playlists_response.dart';
import 'package:spotify_api_consumer/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CategoriesProvider extends ChangeNotifier {
  List<Category> _items = [];
  Category _category;
  List<Playlist> _playlists = [];

  CategoriesProvider.instance() {
    fetchCategories();
  }

  List<Category> get items => _items;
  Category get category => _category;
  List<Playlist> get playlists => _playlists;

  set items(List<Category> value) {
    _items = value;
    notifyListeners();
  }

  set category(Category value) {
    _category = value;
    getPlaylists();
    notifyListeners();
  }

  set playlists(List<Playlist> value) {
    _playlists = value;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    var url = Uri.https(
      'api.spotify.com',
      '/v1/browse/categories',
      {
        'country': 'CO',
        'locale': 'es-CO',
      },
    );

    try {
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': SpotifyConstants.auth,
      });
      print(response.body);
      if (response.statusCode == 200) {
        final json = convert.jsonDecode(response.body);

        final categoriesResponse =
            CategoriesResponse.fromJson(json["categories"]);

        items = categoriesResponse.items;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getPlaylists() async {
    var url = Uri.https(
      'api.spotify.com',
      '/v1/browse/categories/${category.id}/playlists',
      {'country': 'CO'},
    );

    try {
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': SpotifyConstants.auth,
      });
      print(response.body);
      if (response.statusCode == 200) {
        final json = convert.jsonDecode(response.body);
        final playlistsResponse = PlaylistsResponse.fromJson(json["playlists"]);
        playlists = playlistsResponse.items;
      }
    } catch (e) {
      print(e);
    }
  }
}
