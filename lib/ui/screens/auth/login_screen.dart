import 'package:flutter/material.dart';

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
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_translate),
                      label: Text("Google"),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_translate),
                      label: Text("Facebook"),
                    ),
                  ),
                ],
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
