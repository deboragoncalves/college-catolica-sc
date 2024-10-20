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
    _produtosFiltrados = _produtos;
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
                      _filtrarPedidos();
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
                        final pedido = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdicionarEditarProdutos()),
                        );
                        if (pedido != null) {
                          setState(() {
                            _produtos.add(pedido);
                            _produtosFiltrados = List.from(_produtos);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _produtosFiltrados.isEmpty
                  ? Center(
                      child: Text(
                        "Nenhum produto encontrado. Para adicionar novos produtos, clique no ícone +",
                        style: TextStyle(fontSize: 18, color: Color(0xFF7D5638)),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Column(),
            ],
          ),
        ),
      ),
    );
  }

  void _filtrarPedidos() {
    String filtro = _filtroBuscaController.text.toLowerCase().trim();
    setState(() {
      if (filtro.isEmpty) {
        _produtosFiltrados = List.from(_produtos);
      } else {
        _produtosFiltrados = _produtos.where((Map<String, dynamic> produto) {
          bool nomeClienteMatch = produto['nome'].toLowerCase().contains(filtro);
          bool telefoneMatch =
              produto['telefone'].toLowerCase().contains(filtro);
          bool dataMatch = produto['data'].toLowerCase().contains(filtro);
          bool nomeProdutoMatch = false;
          bool precoProdutoMatch = false;

          produto['itens'].forEach((item) {
            nomeProdutoMatch = item['produto'].toLowerCase().contains(filtro);
            precoProdutoMatch = item['preco'].toString().contains(filtro);
          });

          return nomeClienteMatch ||
              telefoneMatch ||
              dataMatch ||
              nomeProdutoMatch ||
              precoProdutoMatch;
        }).toList();
      }
    });
  }

}
