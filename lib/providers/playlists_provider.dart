import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_api_consumer/models/spotify/playlist_details_response.dart';
import 'dart:convert' as convert;

import 'package:spotify_api_consumer/models/spotify/playlists_response.dart';
import 'package:spotify_api_consumer/utils/constants.dart';

class PlaylistsProvider extends ChangeNotifier {
  List<Playlist> _items = [];
  Playlist _playlist;
  List<PlaylistTrack> _playlistTracks;

  PlaylistsProvider.instance() {
    fetchPlaylists();
  }

  List<Playlist> get items => _items;
  Playlist get playlist => _playlist;
  List<PlaylistTrack> get playlistTracks => _playlistTracks;

  set items(List<Playlist> value) {
    _items = value;
    notifyListeners();
  }

  set playlist(Playlist value) {
    _playlist = value;
    getTracks();
    notifyListeners();
  }

  set playlistTracks(List<PlaylistTrack> value) {
    _playlistTracks = value;
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
        'Authorization': SpotifyConstants.auth,
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

  Future<void> getTracks() async {
    var url = Uri.https(
      'api.spotify.com',
      '/v1/playlists/${playlist.id}/tracks',
      {'market': 'CO'},
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

        final container = PlaylistDetailsResponse.fromJson(json);

        playlistTracks = container.items;
      }
    } catch (e) {
      print(e);
    }
  }
}
