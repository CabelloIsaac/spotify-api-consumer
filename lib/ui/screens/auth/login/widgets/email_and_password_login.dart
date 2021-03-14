import 'package:flutter/material.dart';

class EmailAndPasswordLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  bool _fieldsValidated = false;

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
              onPressed: () {},
              icon: Icon(Icons.email),
              label: Text("Sign in with email"),
            ),
          ),
        ],
      ),
    );
  }

  String _validatorEmail(String value) {
    if (value.trim().isEmpty) {
      _fieldsValidated = false;
      return "Please, enter your email address";
    }
    return null;
  }

  String _validatorPassword(String value) {
    if (value.trim().isEmpty) {
      _fieldsValidated = false;
      return "Please, enter your password";
    }
    return null;
  }
}
