import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/login_page.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF7F7F7),
      ),
      home: LoginPage(),
    );
  }
}