import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/adicionar_editar_produtos.dart';
import 'package:projeto_pex/pages/menu_page.dart';

class ExibirProdutos extends StatefulWidget {
  @override
  _ExibirProdutosState createState() => _ExibirProdutosState();
}

class _ExibirProdutosState extends State<ExibirProdutos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> _produtos = [];
  List<Map<String, dynamic>> _produtosFiltrados = [];
  TextEditingController _filtroBuscaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProdutosFromFirebase();
  }

  Future<void> _loadProdutosFromFirebase() async {
    FirebaseFirestore.instance.collection('produtos').get().then((querySnapshot) {
      setState(() {
        _produtos = querySnapshot.docs.map((doc) {
          final produto = doc.data();
          produto['id'] = doc.id; // Guarda o ID do documento
          return produto;
        }).toList();
        _produtosFiltrados = List.from(_produtos);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: MenuPage(scaffoldKey: _scaffoldKey),
      ),
      body: Container(
        color: Color(0xFFF7F7F7),
        margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _filtroBuscaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Buscar',
                        labelStyle: TextStyle(color: Color(0xFFE5CDAE)),
                        filled: true,
                        fillColor: Color(0xFFF7F7F7),
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF7D5638), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF7D5638), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF7D5638), width: 2.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.filter_alt_outlined),
                    color: Color(0xFF7D5638),
                    iconSize: 50,
                    onPressed: () {
                      String query = _filtroBuscaController.text.toLowerCase();

                      setState(() {
                        _produtosFiltrados = _produtos.where((produto) {
                          final nome = produto['nome'].toLowerCase();
                          final descricao =
                              produto['descricao']?.toLowerCase() ??
                                  '';
                          final preco =
                          produto['preco'].toString().toLowerCase();
                          final quantidade =
                          produto['quantidade'].toString().toLowerCase();

                          return nome.contains(query) ||
                              descricao.contains(query) ||
                              preco.contains(query) ||
                              quantidade.contains(query);
                        }).toList();
                      });
                    },
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF7D5638), width: 2),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      color: Color(0xFF7D5638),
                      iconSize: 24,
                      onPressed: () async {
                        final resultado = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdicionarEditarProdutos()),
                        );
                        if (resultado != null && resultado['atualizar'] == true) {
                          await _loadProdutosFromFirebase();
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (_produtosFiltrados.isNotEmpty) ...[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _produtosFiltrados.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _buildHeaderRow();
                    }

                    final produto = _produtosFiltrados[index - 1];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildProductColumn(produto['codigo'], 43), // Exibe o código do produto
                          _buildProductColumn('${produto['nome']}', 80),
                          _buildProductColumn('R\$ ${produto['preco'].toStringAsFixed(2)}', 80),
                          _buildProductColumn('${produto['quantidade']}', 80),
                          _buildActionColumn(index - 1),
                        ],
                      ),
                    );
                  },
                ),
              ] else
                Center(
                  child: Text(
                    "Nenhum produto encontrado. Para adicionar novos produtos, clique no ícone +",
                    style: TextStyle(fontSize: 18, color: Color(0xFF7D5638)),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF7D5638), width: 1.5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderColumn('ID', 30, 10.0),
          _buildHeaderColumn('Produto', 60, 0),
          _buildHeaderColumn('Preço', 60, 0),
          _buildHeaderColumn('Estoque', 60, 0),
          _buildHeaderColumn('Ação', 60, 0),
        ],
      ),
    );
  }

  Widget _buildProductColumn(String text, double width) {
    return Container(
      width: width,
      child: Text(
        text,
        style: TextStyle(color: Color(0xFF7D5638)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildHeaderColumn(String text, double width, double paddingLeft) {
    return Container(
      width: width,
      padding: EdgeInsets.only(left: paddingLeft),
      child: Text(
        text,
        style: TextStyle(color: Color(0xFF7D5638), fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildActionColumn(int index) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.create_outlined,
            color: Color(0xFF7D5638),
            size: 20,
          ),
          onPressed: () async {
            final resultado = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdicionarEditarProdutos(
                  produto: _produtosFiltrados[index],
                ),
              ),
            );
            if (resultado != null && resultado['atualizar'] == true) {
              await _loadProdutosFromFirebase();
            }
          },
        ),
        IconButton(
          icon: Icon(
            Icons.restore_from_trash,
            color: Color(0xFF7D5638),
            size: 20,
          ),
          onPressed: () async {
            final produto = _produtosFiltrados[index];
            final produtoId = produto['id'];
            await FirebaseFirestore.instance.collection('produtos').doc(produtoId).delete();
            await _loadProdutosFromFirebase();
          },
        ),
      ],
    );
  }
}
