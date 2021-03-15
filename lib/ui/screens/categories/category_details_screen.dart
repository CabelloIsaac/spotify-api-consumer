import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/providers/categories_provider.dart';
import 'package:spotify_api_consumer/ui/widgets/header_text.dart';
import 'package:spotify_api_consumer/ui/widgets/subtitle_text.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static final String route = "/CategoryDetailsScreen";
  @override
  Widget build(BuildContext context) {
    final playlistsProvider = Provider.of<CategoriesProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText("playlistsProvider.playlist.name"),
          SubtitleText("Tracks"),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                // PlaylistTrack playlistTrack =
                //     playlistsProvider.playlistTracks[index];
                // Track track = playlistTrack.track;
                // return TrackItem(track: track);
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
