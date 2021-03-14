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
              // SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.white,
                    height: 80,
                    endIndent: 20,
                  )),
                  Text("or"),
                  Expanded(
                      child: Divider(
                    height: 80,
                    indent: 20,
                    color: Colors.white,
                  )),
                ],
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.email),
                  label: Text("Sign in with email"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
