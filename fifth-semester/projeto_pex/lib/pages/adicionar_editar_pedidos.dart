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
  List<Map<String, dynamic>> _itens = [];

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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    _buildTextField(_nomeController, 'Nome'),
                    SizedBox(height: 20.0),
                    _buildTextField(_enderecoController, 'Endereço'),
                    SizedBox(height: 20.0),
                    _buildTextField(_telefoneController, 'Telefone',
                        keyboardType: TextInputType.phone),
                    SizedBox(height: 20.0),
                    _buildTextField(_emailController, 'E-mail',
                        keyboardType: TextInputType.emailAddress),
                    SizedBox(height: 20.0),
                    _buildTextField(_dataController, 'Data',
                        keyboardType: TextInputType.datetime),
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
                              validarCampos();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _itens.length,
                      itemBuilder: (context, index) {
                        final item = _itens[index];
                        return Container(
                          margin: EdgeInsets.all(0.0),
                          padding: EdgeInsets.all(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "01",
                                style: TextStyle(
                                  color: Color(0xFF7D5638),
                                ),
                              ),
                              Text(
                                item['produto'],
                                style: TextStyle(
                                  color: Color(0xFF7D5638), 
                                ),
                              ),
                              Text(
                                "${item['quantidade']} un",
                                style: TextStyle(
                                  color: Color(0xFF7D5638), 
                                ),
                              ),
                              Text(
                                "R\$ 10,00/un",
                                style: TextStyle(
                                  color: Color(0xFF7D5638),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.restore_from_trash, color: Color(0xFF7D5638)),
                                onPressed: () {
                                  setState(() {
                                    _itens.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text(
                  'SALVAR',
                  style: TextStyle(color: Color(0xFFF3E6D4)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7D5638),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
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

  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: _buildInputDecoration(label),
      style: TextStyle(color: Colors.black),
    );
  }

  void validarCampos() {
    String email = _emailController.text.trim();
    bool isEmailValid = email.contains('@') &&
        email.contains('.') &&
        email.indexOf('@') < email.lastIndexOf('.') &&
        email.length >= 6;

    if (_nomeController.text.isEmpty) {
      _exibirModalErro("O campo Nome deve ser preenchido.");
    } else if (_enderecoController.text.isEmpty) {
      _exibirModalErro("O campo Endereço deve ser preenchido.");
    } else if (_telefoneController.text.isEmpty) {
      _exibirModalErro("O campo Telefone deve ser preenchido.");
    } else if (!isEmailValid) {
      _exibirModalErro('Email inválido. Verifique se tem "@" e ".".');
    } else if (_dataController.text.isEmpty) {
      _exibirModalErro("O campo Data deve ser preenchido.");
    } else if (_produtoSelecionado == null) {
      _exibirModalErro("O campo Produto deve ser preenchido.");
    } else if (_quantidadeController.text.isEmpty) {
      _exibirModalErro("O campo Quantidade deve ser preenchido.");
    } else {
      setState(() {
        _itens.add({
          'produto': _produtoSelecionado,
          'quantidade': _quantidadeController.text,
        });
      });
      _produtoSelecionado = null;
      _quantidadeController.clear();
    }
  }

  void _exibirModalErro(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF7D5638),
          content: Text(
            mensagem,
            style: TextStyle(
              color: Color(0xFFE5CDAE),
            ),
          ),
          actions: [
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
}
