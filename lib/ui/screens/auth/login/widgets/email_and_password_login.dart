import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/providers/auth_provider.dart';

class EmailAndPasswordLogin extends StatefulWidget {
  @override
  _EmailAndPasswordLoginState createState() => _EmailAndPasswordLoginState();
}

class _EmailAndPasswordLoginState extends State<EmailAndPasswordLogin> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  AuthProvider _authProvider;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controllerEmail,
            validator: _validatorEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextFormField(
            controller: _controllerPassword,
            validator: _validatorPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility),
                onPressed: _showOrHidePassord,
              ),
            ),
            obscureText: _obscurePassword,
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

  void _showOrHidePassord() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  String _validatorEmail(String value) {
    if (value.trim().isEmpty) {
      return "Please, enter your email address";
    } else if (!EmailValidator.validate(value.trim())) {
      return "Please, enter a valid email address";
    }
    return null;
  }

  String _validatorPassword(String value) {
    if (value.trim().isEmpty) return "Please, enter your password";
    return null;
  }

  void _login() {
    if (_formKey.currentState.validate()) {
      String email = _controllerEmail.text.trim();
      String password = _controllerPassword.text.trim();
      _authProvider.signInWithEmailAndPassword(email, password);
    } else {
      print("Error in some field");
    }
  }
}
