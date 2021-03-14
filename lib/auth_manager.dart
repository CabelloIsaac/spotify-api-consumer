import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/providers/auth_provider.dart';
import 'package:spotify_api_consumer/ui/screens/auth/login/login_screen.dart';

class AuthScreenManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, AuthProvider authProvider, _) {
        switch (authProvider.status) {
          case Status.Authenticated:
            return Container(
              child: ElevatedButton(
                child: Text("Signout"),
                onPressed: () {
                  authProvider.signOut();
                },
              ),
            );
          default:
            return LoginScreen();
        }
      },
    );
  }
}
