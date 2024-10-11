import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/confirma_token_page.dart';

class TokenPage extends StatelessWidget {
  final String email;

  TokenPage({required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _tokenController = TextEditingController();

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
                fontSize: 22,
              ),
              textAlign: TextAlign.justify,
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

    void _validateAndReceiveToken() {
      String tokenEmail = _tokenController.text.trim();

      // Validação do email
      bool isEmailValid = tokenEmail.contains('@') &&
          tokenEmail.contains('.') &&
          tokenEmail.indexOf('@') < tokenEmail.lastIndexOf('.') &&
          tokenEmail.endsWith('.com');

      if (!isEmailValid) {
        _showDialog(context, 'Email inválido. Verifique se tem "@" e ".com".');
      } else {
        // exibir modal e depois de 30 segundos ir para a tela de confirmação do token
        _showDialog(context, 'Token foi enviado para o seu email.');
        Future.delayed(Duration(seconds: 30), () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConfirmaTokenPage(token: tokenEmail)),
          );
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
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
                controller: _tokenController,
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
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  _validateAndReceiveToken();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF7D5638),
                  backgroundColor: Color(0xFFE5CDAE),
                ),
                child: Center(
                  child: Text(
                    'RECEBER TOKEN',
                    style: TextStyle(
                      color: Color(0xFF7D5638),
                    ),
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
