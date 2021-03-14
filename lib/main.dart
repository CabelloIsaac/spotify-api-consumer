import 'package:flutter/material.dart';
import 'package:spotify_api_consumer/router.dart';
import 'package:spotify_api_consumer/ui/screens/auth/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Api Consumer',
      routes: MyRouter.routes,
      initialRoute: LoginScreen.route,
    );
  }
}
