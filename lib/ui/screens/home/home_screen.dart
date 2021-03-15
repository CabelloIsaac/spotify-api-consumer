import 'package:flutter/material.dart';

import 'widgets/categories_list.dart';
import 'widgets/playlists_list.dart';
import 'widgets/header_text.dart';
import 'widgets/subtitle_text.dart';

class HomeScreen extends StatelessWidget {
  static final String route = "/HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderText("Music"),
                SubtitleText("Categories"),
                CategoriesList(),
                SizedBox(height: 20),
                SubtitleText("Playlists"),
                PlaylistsList(),
                SizedBox(height: 20),
                SubtitleText("Albums"),
                CategoriesList(),
                SizedBox(height: 20),
                SubtitleText("Artists"),
                CategoriesList(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
