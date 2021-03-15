import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/models/spotify/playlist_details_response.dart';
import 'package:spotify_api_consumer/providers/playlists_provider.dart';
import 'package:spotify_api_consumer/ui/screens/artists/artist_details_screen.dart';
import 'package:spotify_api_consumer/ui/widgets/header_text.dart';
import 'package:spotify_api_consumer/ui/widgets/subtitle_text.dart';

class PlaylistDetailsScreen extends StatelessWidget {
  static final String route = "/PlaylistDetailsScreen";
  @override
  Widget build(BuildContext context) {
    final playlistsProvider = Provider.of<PlaylistsProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(playlistsProvider.playlist.name),
          SubtitleText("Tracks"),
          Expanded(
            child: ListView.builder(
              itemCount: playlistsProvider.playlistTracks.length,
              itemBuilder: (BuildContext context, int index) {
                PlaylistTrack playlistTrack =
                    playlistsProvider.playlistTracks[index];
                Track track = playlistTrack.track;
                return TrackItem(track: track);
              },
            ),
          ),
        ],
      ),
    );
  }
}
