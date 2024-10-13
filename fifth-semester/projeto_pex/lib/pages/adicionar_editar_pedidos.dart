import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/menu_page.dart';

class AdicionarEditarPedidos extends StatefulWidget {
  @override
  _AdicionarEditarPedidosState createState() => _AdicionarEditarPedidosState();
}

class _AdicionarEditarPedidosState extends State<AdicionarEditarPedidos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  String? _produtoSelecionado;
  List<String> _produtos = ["Produto 1", "Produto 2", "Produto 3"];

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
            children: [
              SizedBox(height: 20.0),
              _buildTextField(_nomeController, 'Nome'),
              SizedBox(height: 20.0),
              _buildTextField(_enderecoController, 'Endereço'),
              SizedBox(height: 20.0),
              _buildTextField(_telefoneController, 'Telefone', keyboardType: TextInputType.phone),
              SizedBox(height: 20.0),
              _buildTextField(_emailController, 'E-mail', keyboardType: TextInputType.emailAddress),
              SizedBox(height: 20.0),
              _buildTextField(_dataController, 'Data', keyboardType: TextInputType.datetime),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _produtoSelecionado,
                      decoration: _buildInputDecoration("Produto"),
                      items: _produtos.map((String produto) {
                        return DropdownMenuItem<String>(
                          value: produto,
                          child: Text(produto),
                        );
                      }).toList(),
                      onChanged: (String? novoProduto) {
                        setState(() {
                          _produtoSelecionado = novoProduto;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: TextField(
                      controller: _quantidadeController,
                      keyboardType: TextInputType.number,
                      decoration: _buildInputDecoration('Quantidade'),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 20.0),
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
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Color(0xFFE5CDAE)),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF7D5638), width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF7D5638), width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF7D5638), width: 2.0),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: _buildInputDecoration(label),
      style: TextStyle(color: Colors.black),
    );
  }
}
