import 'package:flutter/material.dart';

class TrackItem extends StatelessWidget {
  const TrackItem({
    Key key,
    @required this.track,
  }) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          track.album.images.first.url,
          height: 50,
          width: 50,
        ),
      ),
      title: Text(track.name),
      subtitle: Text(track.artists.first.name),
      onTap: () => Navigator.pushNamed(context, ArtistDetailsScreen.route),
    );
  }
}
