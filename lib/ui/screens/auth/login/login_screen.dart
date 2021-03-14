import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/providers/auth_provider.dart';

import 'widgets/email_and_password_login.dart';
import 'widgets/header.dart';
import 'widgets/login_methods_divider.dart';
import 'widgets/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  static final route = "/LoginScreen";
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                Header(),
                SizedBox(height: 40),
                EmailAndPasswordLogin(),
                LoginMethodsDivider(),
                SocialLoginButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
