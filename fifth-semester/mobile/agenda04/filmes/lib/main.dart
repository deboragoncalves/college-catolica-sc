import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de filmes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> filmes = [];
  final TextEditingController _controller = TextEditingController();

  void _adicionarFilme() {
    String novoFilme = _controller.text.trim(); // Removendo espaços
    if (novoFilme.isEmpty) {
      _exibirAlerta("Informe o nome do filme.");
    } else {
      setState(() {
        filmes.add(novoFilme);
        _controller.clear(); // Limpar o campo
      });
      _exibirAlerta("Filme adicionado");
    }
  }

  void _removerFilme(int index) {
    setState(() {
      filmes.removeAt(index);
    });
    _exibirAlerta("Filme excluído");
  }

  void _exibirAlerta(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção"),
          content: Text(mensagem),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
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
        title: Text("Lista de filmes"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5, // 80% da largura da tela
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Nome do filme",
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _adicionarFilme,
                child: Text("Adicionar"),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filmes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filmes[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removerFilme(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
