import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/providers/auth_provider.dart';

import 'widgets/email_and_password_login.dart';
import 'widgets/error_message.dart';
import 'widgets/header.dart';
import 'widgets/loading_indicator.dart';
import 'widgets/login_methods_divider.dart';
import 'widgets/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  static final route = "/LoginScreen";
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final authenticating = authProvider.status == Status.Authenticating;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(40),
              child: Center(
                child: Column(
                  children: [
                    Header(),
                    SizedBox(height: 40),
                    EmailAndPasswordLogin(),
                    ErrorMessage(),
                    LoginMethodsDivider(),
                    SocialLoginButtons(),
                  ],
                ),
              ),
            ),
            if (authenticating) LoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
