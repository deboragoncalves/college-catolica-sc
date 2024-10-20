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
                          borderSide: BorderSide(color: Color(0xFF7D5638), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF7D5638), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF7D5638), width: 2.0),
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
                    onPressed: () => {},
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
                        final produto = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdicionarEditarProdutos()),
                        );
                        if (produto != null) {
                          setState(() {
                            _produtos.add(produto);
                            _produtosFiltrados = List.from(_produtos);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (_produtosFiltrados.isNotEmpty) ...[
                if (_produtosFiltrados.length == 1) _buildHeaderRow(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _produtosFiltrados.length,
                  itemBuilder: (context, index) {
                    final produto = _produtosFiltrados[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildProductColumn('01', 43),
                          _buildProductColumn('${produto['nome']}', 80),
                          _buildProductColumn('R\$ ${produto['preco'].toStringAsFixed(2)}', 80),
                          _buildProductColumn('${produto['quantidade']}', 80),
                          _buildActionColumn(index),
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
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.restore_from_trash,
            color: Color(0xFF7D5638),
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _produtos.removeAt(index);
              _produtosFiltrados = List.from(_produtos);
            });
          },
        ),
      ],
    );
  }
}
