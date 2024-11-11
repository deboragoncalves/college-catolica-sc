import 'package:agenda08/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login realizado com sucesso!")),
        );
        Future.delayed(Duration(seconds: 15), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });
      }
    } catch (e) {
      print("Erro no login: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro no login: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Login"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.6, 
                child: ElevatedButton(
                  onPressed: signIn,
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
