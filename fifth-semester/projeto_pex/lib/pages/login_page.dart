import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/token_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndLogin(BuildContext context) {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Validação do email
    bool isEmailValid = email.contains('@') &&
        email.contains('.') &&
        email.indexOf('@') < email.lastIndexOf('.') &&
        email.length >= 6;

    // Validação da senha
    bool isPasswordValid = password.length >= 8;

    if (!isEmailValid) {
      _showDialog(context, 'Email inválido. Verifique se tem "@" e ".".');
    } else if (!isPasswordValid) {
      _showDialog(context, 'A senha deve ter pelo menos 8 caracteres.');
    } else {
      // Se as validações passarem, navegue para a próxima página
      print('Email e senha válidos');
    }
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF7D5638),
          content: Text(
            message,
            style: TextStyle(
              color: Color(0xFFE5CDAE),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFF3E6D4),
                foregroundColor: Color(0xFF7D5638),
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/logo.jpeg',
                  height: 100,
                ),
              ),
              SizedBox(height: 200.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color(0xFFE5CDAE),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF7D5638),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF7D5638),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF7D5638),
                      width: 2.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Color(0xFFE5CDAE),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF7D5638),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF7D5638),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF7D5638),
                      width: 2.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
                obscureText: true,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  _validateAndLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF7D5638),
                  backgroundColor: Color(0xFFE5CDAE),
                ),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color(0xFF7D5638),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TokenPage(email: _emailController.text)),
                  );
                },
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    color: Color(0xFF7D5638),
                  ),
                ),
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}