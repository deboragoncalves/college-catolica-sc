import 'package:flutter/material.dart';

void main() {
  runApp(MaravilhasApp());
}

class MaravilhasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7 Maravilhas do Mundo Moderno',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaravilhasScreen(),
    );
  }
}

class Maravilha {
  final String nome;
  final String descricao;
  final String imagem;

  Maravilha({
    required this.nome,
    required this.descricao,
    required this.imagem,
  });
}

class MaravilhasScreen extends StatelessWidget {
  final List<Maravilha> maravilhas = [
    Maravilha(
      nome: 'Grande Muralha da China',
      descricao:
          'A Grande Muralha da China é uma série de fortificações feitas de pedra, tijolo, terra batida, madeira e outros materiais, geralmente construídas ao longo de uma linha leste-oeste ao longo das fronteiras históricas do norte da China.',
      imagem: 'assets/muralha_china.jpg',
    ),
    Maravilha(
      nome: 'Petra',
      descricao:
          'Petra é um famoso sítio arqueológico na Jordânia, que tem sido habitado desde tempos pré-históricos e é famoso por sua arquitetura esculpida em pedra.',
      imagem: 'assets/petra.jpeg',
    ),
    Maravilha(
      nome: 'Cristo Redentor',
      descricao:
          'O Cristo Redentor é uma estátua de Jesus Cristo no Rio de Janeiro, Brasil, considerada a maior estátua de Art Deco do mundo e um símbolo do Cristianismo em todo o mundo.',
      imagem: 'assets/cristo.jpg',
    ),
    Maravilha(
      nome: 'Machu Picchu',
      descricao:
          'Machu Picchu é uma antiga cidade inca no topo de uma montanha, no Peru, que é conhecida por sua arquitetura sofisticada e pelas vistas espetaculares.',
      imagem: 'assets/peru.jpg',
    ),
    Maravilha(
      nome: 'Chichén Itzá',
      descricao:
          'Chichén Itzá é uma grande cidade pré-colombiana construída pelos maias, localizada no estado de Yucatán, no México. É famosa pela pirâmide de Kukulkán.',
      imagem: 'assets/itza.jpg',
    ),
    Maravilha(
      nome: 'Coliseu',
      descricao:
          'O Coliseu é um anfiteatro oval no centro de Roma, Itália, construído sob os imperadores da dinastia Flaviana, e é considerado uma das maiores obras da arquitetura e da engenharia romanas.',
      imagem: 'assets/coliseu.jpg',
    ),
    Maravilha(
      nome: 'Taj Mahal',
      descricao:
          'O Taj Mahal é um mausoléu de mármore branco encomendado pelo imperador Mughal Shah Jahan em memória de sua esposa Mumtaz Mahal, localizado em Agra, na Índia.',
      imagem: 'assets/mahal.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7 Maravilhas do Mundo Moderno'),
      ),
      body: ListView.builder(
        itemCount: maravilhas.length,
        itemBuilder: (context, index) {
          final maravilha = maravilhas[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    maravilha.nome,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(maravilha.descricao),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: 200,
                  height: 200, // altura personalizada
                  child: Image.asset(
                    maravilha.imagem,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
