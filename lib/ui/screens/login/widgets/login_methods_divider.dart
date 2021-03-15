import 'package:flutter/material.dart';

class LoginMethodsDivider extends StatelessWidget {
  const LoginMethodsDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
