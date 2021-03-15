import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/providers/auth_provider.dart';

import 'ui/screens/home/home_screen.dart';
import 'ui/screens/login/login_screen.dart';

class AuthScreenManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, AuthProvider authProvider, _) {
        switch (authProvider.status) {
          case Status.Authenticated:
            return Container(
              child: HomeScreen(),
            );
          default:
            return LoginScreen();
        }
      },
    );
  }
}
