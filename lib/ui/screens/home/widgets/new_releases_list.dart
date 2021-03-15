import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotify_api_consumer/providers/albums_provider.dart';
import 'package:spotify_api_consumer/models/spotify/albums_response.dart';

import 'home_list_item.dart';

class NewReleasesList extends StatelessWidget {
  const NewReleasesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumsProvider = Provider.of<AlbumsProvider>(context);
    final albums = albumsProvider.items;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buildItemsList(albums),
      ),
    );
  }

  List<Widget> _buildItemsList(List<Album> categories) {
    List<Widget> widgets = [SizedBox(width: 20)];
    widgets.addAll(categories.map((e) => HomeListItem(
          imageUrl: e.images.first.url,
          onTap: () {},
          title: e.name,
        )));
    return widgets;
  }
}
