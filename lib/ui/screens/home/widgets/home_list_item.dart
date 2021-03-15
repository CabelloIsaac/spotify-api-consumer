import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onTap;

  const HomeListItem(
      {Key key,
      @required this.imageUrl,
      @required this.title,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  imageUrl,
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 100,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
