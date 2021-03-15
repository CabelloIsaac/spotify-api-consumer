import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/models/spotify/playlists_response.dart';
import 'package:spotify_api_consumer/providers/categories_provider.dart';
import 'package:spotify_api_consumer/providers/playlists_provider.dart';
import 'package:spotify_api_consumer/ui/screens/playlists/playlist_details_screen.dart';
import 'package:spotify_api_consumer/ui/widgets/header_text.dart';
import 'package:spotify_api_consumer/ui/widgets/subtitle_text.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static final String route = "/CategoryDetailsScreen";
  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(categoriesProvider.category.name),
          SubtitleText("Playlists"),
          Expanded(
            child: ListView.builder(
              itemCount: categoriesProvider.playlists.length,
              itemBuilder: (BuildContext context, int index) {
                Playlist playlist = categoriesProvider.playlists[index];
                return PlaylistItem(playlist: playlist);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlaylistItem extends StatelessWidget {
  const PlaylistItem({
    Key key,
    @required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    final playlistsProvider = Provider.of<PlaylistsProvider>(context);
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          playlist.images.first.url,
          height: 50,
          width: 50,
        ),
      ),
      title: Text(playlist.name),
      subtitle: Text("${playlist.tracks.total} tracks"),
      onTap: () {
        playlistsProvider.playlist = playlist;
        Navigator.pushNamed(context, PlaylistDetailsScreen.route);
      },
    );
  }
}
