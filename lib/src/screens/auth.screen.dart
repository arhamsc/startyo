import 'package:flutter/material.dart';
import 'package:startyo/src/widgets/UI/header1.ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderText(text: "Login"),
          Container()
        ],
      ),
    );
  }
}
