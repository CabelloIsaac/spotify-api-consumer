import 'package:flutter/material.dart';

class EmailAndPasswordLogin extends StatelessWidget {
  const EmailAndPasswordLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        ),
      ],
    );
  }
}
