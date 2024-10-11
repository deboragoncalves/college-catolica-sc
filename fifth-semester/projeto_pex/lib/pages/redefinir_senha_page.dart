import 'package:flutter/material.dart';

class RedefinirSenhaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _senhaController = TextEditingController();
    final TextEditingController _confirmarSenhaController =
        TextEditingController();

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

    void _redefinirSenha() {
      String senha = _senhaController.text.trim();
      String confirmarSenha = _confirmarSenhaController.text.trim();

      if (senha.isEmpty || confirmarSenha.isEmpty) {
        _showDialog(context,
            'Os campos Senha e Confirmar Senha não podem estar vazios.');
      } else if (senha.length < 8 || confirmarSenha.length < 8) {
        _showDialog(context, 'A senha deve ter no mínimo 8 caracteres.');
      } else if (senha != confirmarSenha) {
        _showDialog(context, 'As senhas não coincidem.');
      } else {
        _showDialog(context, 'Senha redefinida com sucesso.');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Redefinir Senha'),
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
                controller: _senhaController,
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
              SizedBox(height: 16.0),
              TextField(
                controller: _confirmarSenhaController,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
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
                  _redefinirSenha();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF7D5638),
                  backgroundColor: Color(0xFFE5CDAE),
                ),
                child: Center(
                  child: Text(
                    'REDEFINIR SENHA',
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
