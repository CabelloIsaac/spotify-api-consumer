import 'package:flutter/material.dart';

import 'ui/screens/categories/category_details_screen.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/screens/login/login_screen.dart';
import 'ui/screens/playlists/playlist_details_screen.dart';

class MyRouter {
  static final routes = {
    LoginScreen.route: (BuildContext context) => LoginScreen(),
    HomeScreen.route: (BuildContext context) => HomeScreen(),
    PlaylistDetailsScreen.route: (BuildContext context) =>
        PlaylistDetailsScreen(),
    CategoryDetailsScreen.route: (BuildContext context) =>
        CategoryDetailsScreen(),
  };
}
