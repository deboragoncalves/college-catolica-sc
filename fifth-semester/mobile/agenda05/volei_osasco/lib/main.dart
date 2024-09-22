import 'package:flutter/material.dart';

void main() {
  runApp(VoleiOsascoApp());
}

class VoleiOsascoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vôlei Osasco',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time de Vôlei Osasco'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(
                  16.0), // Ajusta o padding para remover o espaço extra
              color: Colors.white, // Fundo branco
              alignment: Alignment.centerLeft, // Alinha o texto à esquerda
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black, // Texto preto
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text('Início'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.black),
              title: Text('Jogadoras'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JogadorasPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/osasco.JPG',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JogadorasPage()),
                    );
                  },
                  child: Text('Conheça as Jogadoras'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JogadorasPage extends StatelessWidget {
  final List<Map<String, String>> jogadoras = [
    {'nome': 'Tandara Caixeta', 'posicao': 'Oposta'},
    {'nome': 'Camila Brait', 'posicao': 'Libero'},
    {'nome': 'Fabiana Claudino', 'posicao': 'Central'},
    {'nome': 'Gabi Cândido', 'posicao': 'Ponteira'},
    {'nome': 'Mayany Souza', 'posicao': 'Central'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogadoras do Osasco'),
      ),
      body: ListView.builder(
        itemCount: jogadoras.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.sports_volleyball),
              title: Text(jogadoras[index]['nome']!),
              subtitle: Text('Posição: ${jogadoras[index]['posicao']}'),
            ),
          );
        },
      ),
    );
  }
}
