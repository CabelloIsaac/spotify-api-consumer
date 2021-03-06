import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/auth_manager.dart';
import 'package:spotify_api_consumer/providers/albums_provider.dart';
import 'package:spotify_api_consumer/providers/auth_provider.dart';
import 'package:spotify_api_consumer/providers/categories_provider.dart';
import 'package:spotify_api_consumer/providers/playlists_provider.dart';
import 'package:spotify_api_consumer/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider.instance()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider.instance()),
        ChangeNotifierProvider(create: (_) => PlaylistsProvider.instance()),
        ChangeNotifierProvider(create: (_) => AlbumsProvider.instance()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spotify Api Consumer',
        routes: MyRouter.routes,
        home: AuthScreenManager(),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
          accentColor: Colors.green,
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.black),
          scaffoldBackgroundColor: Colors.black,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
