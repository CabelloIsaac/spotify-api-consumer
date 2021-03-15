import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/models/spotify/playlists_response.dart';

import 'home_list_item.dart';

import 'package:spotify_api_consumer/providers/playlists_provider.dart';

class PlaylistsList extends StatelessWidget {
  const PlaylistsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlistsProvider = Provider.of<PlaylistsProvider>(context);
    final playlists = playlistsProvider.items;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buildCategoryItemsList(playlists),
      ),
    );
  }

  List<Widget> _buildCategoryItemsList(List<Item> categories) {
    List<Widget> widgets = [SizedBox(width: 20)];
    widgets.addAll(categories.map((e) => HomeListItem(
          imageUrl: e.images.first.url,
          onTap: () {},
          title: e.name,
        )));
    return widgets;
  }
}
