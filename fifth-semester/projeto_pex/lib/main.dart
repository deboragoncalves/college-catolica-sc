import 'package:flutter/material.dart';

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
          title: Text('Erro'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
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
                        builder: (context) =>
                            TokenPage(email: _emailController.text)),
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
            title: Text('Erro'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
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
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConfirmTokenPage(token: tokenEmail)),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Receber Token'),
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

class ConfirmTokenPage extends StatelessWidget {
  final String token;

  ConfirmTokenPage({required this.token});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _tokenController = TextEditingController();

    void _showDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void _validateAndConfirmToken() {
      String tokenInput = _tokenController.text.trim();

      if (tokenInput.isEmpty) {
        _showDialog(context, 'O campo Token não pode estar vazio.');
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RedefinirSenhaPage()),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmar Token'),
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
                  labelText: 'Token',
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
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  _validateAndConfirmToken();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF7D5638),
                  backgroundColor: Color(0xFFE5CDAE),
                ),
                child: Center(
                  child: Text(
                    'CONFIRMAR',
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
            title: Text('Erro'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
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
        print('Senha redefinida: $senha');
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
