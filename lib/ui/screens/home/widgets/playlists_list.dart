import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/providers/playlists_provider.dart';
import 'package:spotify_api_consumer/ui/screens/playlists/playlist_details_screen.dart';

import 'home_list_item.dart';

class PlaylistsList extends StatelessWidget {
  const PlaylistsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlistsProvider = Provider.of<PlaylistsProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buildCategoryItemsList(context, playlistsProvider),
      ),
    );
  }

  List<Widget> _buildCategoryItemsList(
    BuildContext context,
    PlaylistsProvider playlistsProvider,
  ) {
    List<Widget> widgets = [SizedBox(width: 20)];
    widgets.addAll(
      playlistsProvider.items.map(
        (e) => HomeListItem(
          imageUrl: e.images.first.url,
          onTap: () {
            playlistsProvider.playlist = e;
            Navigator.pushNamed(context, PlaylistDetailsScreen.route);
          },
          title: e.name,
        ),
      ),
    );
    return widgets;
  }
}
