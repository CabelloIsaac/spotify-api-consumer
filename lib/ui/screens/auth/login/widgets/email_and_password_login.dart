import 'package:flutter/material.dart';

class EmailAndPasswordLogin extends StatefulWidget {
  @override
  _EmailAndPasswordLoginState createState() => _EmailAndPasswordLoginState();
}

class _EmailAndPasswordLoginState extends State<EmailAndPasswordLogin> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: _validatorEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextFormField(
            validator: _validatorPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(labelText: "Password"),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _login,
              icon: Icon(Icons.email),
              label: Text("Sign In With Email"),
            ),
          ),
        ],
      ),
    );
  }

  String _validatorEmail(String value) {
    if (value.trim().isEmpty) return "Please, enter your email address";
    return null;
  }

  String _validatorPassword(String value) {
    if (value.trim().isEmpty) return "Please, enter your password";
    return null;
  }

  void _login() {
    if (_formKey.currentState.validate()) {
      print("Validated");
    } else {
      print("Error in some field");
    }
  }
}
