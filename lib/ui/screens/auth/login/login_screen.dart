import 'package:flutter/material.dart';

import 'widgets/email_and_password_login.dart';
import 'widgets/login_methods_divider.dart';
import 'widgets/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  static final route = "/LoginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/spotify.png", height: 100, width: 100),
              Text("Welcome Back"),
              SocialLoginButtons(),
              LoginMethodsDivider(),
              EmailAndPasswordLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
