import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:spotify_api_consumer/models/spotify/playlists_response.dart';

class PlaylistsProvider extends ChangeNotifier {
  List<Playlist> _items = [];
  Playlist _playlist;

  PlaylistsProvider.instance() {
    fetchPlaylists();
  }

  List<Playlist> get items => _items;
  Playlist get playlist => _playlist;

  set items(List<Playlist> value) {
    _items = value;
    notifyListeners();
  }

  set playlist(Playlist value) {
    _playlist = value;
    notifyListeners();
  }

  Future<void> fetchPlaylists() async {
    var url = Uri.https(
      'api.spotify.com',
      '/v1/browse/featured-playlists',
      {
        'country': 'CO',
        'locale': 'es-CO',
      },
    );

    try {
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer BQCq4hTyULs_EFX_D6ENkgVtPZo_REwdZ7RFE9Xc2Bz7xedpweXtRWaWjWhx1mLDBaWg81_R_9W2CLrLY3dJf_Y_JyuiXb5j_eYJp1Hd8nl3L8SGlIx3mSaqbaC2BfaQ6xP6FroronH9XySmh5Uq3nzcJNyu9GYznIFPUpLNWMoOi1bP_9YFPqF-K3HJFVTsDey3szCg4R_VadFHtLXeSBOSySx5NRaZDZp2Ru0rqTl9sOmcYk2HozQPdTMxHBa2Xy_9Hlxi4kGTxAqPZonWpVHlxkLxB3MyeOrkavie',
      });
      print(response.body);
      if (response.statusCode == 200) {
        final json = convert.jsonDecode(response.body);

        final categoriesResponse =
            PlaylistsResponse.fromJson(json["playlists"]);

        items = categoriesResponse.items;
      }
    } catch (e) {
      print(e);
    }
  }
}
