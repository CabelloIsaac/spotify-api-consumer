import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_consumer/providers/auth_provider.dart';

class ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return authProvider.errorMessage.error
        ? Column(
            children: [
              SizedBox(height: 10),
              Container(
                child: Text(
                  "${authProvider.errorMessage.message}",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        : Container();
  }
}
