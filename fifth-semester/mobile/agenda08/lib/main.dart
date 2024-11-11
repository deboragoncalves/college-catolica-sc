import 'package:agenda08/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB-6Htqmvo4oojGXz7dwb3_ep817z5kTfY",
      authDomain: "crud-firebase-flutter-6eef1.firebaseapp.com",
      projectId: "crud-firebase-flutter-6eef1",
      storageBucket: "crud-firebase-flutter-6eef1.appspot.com",
      messagingSenderId: "512883715209",
      appId: "1:512883715209:web:a0e85f2f14d3777a782a58",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginForm(),
    );
  }
}
