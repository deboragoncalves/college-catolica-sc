import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/menu_page.dart';
import 'package:flutter/services.dart';

class AdicionarEditarProdutos extends StatefulWidget {
  final Map<String, dynamic>? produto;

  AdicionarEditarProdutos({this.produto});

  @override
  _AdicionarEditarProdutosState createState() =>
      _AdicionarEditarProdutosState();
}

class _AdicionarEditarProdutosState extends State<AdicionarEditarProdutos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  Map<String, dynamic> _produtoSalvo = {};

  @override
  void initState() {
    super.initState();
    if (widget.produto != null) {
      _nomeController.text = widget.produto!['nome'];
      _precoController.text = widget.produto!['preco'].toString();
      _descricaoController.text = widget.produto!['descricao'];
      _quantidadeController.text =
          widget.produto!['quantidade'].toString();
    }
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
        child: Column(
          children: [
            Text(
              "PRODUTO",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7D5638),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    _buildTextField(
                        _nomeController, 'Nome', TextInputType.text),
                    SizedBox(height: 20.0),
                    _buildTextField(_descricaoController, 'Descrição Detalhada',
                        TextInputType.text),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            _precoController,
                            'Preço',
                            TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}'))
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Expanded(
                          child: _buildTextField(
                            _quantidadeController,
                            'Qtde Estoque',
                            TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          validarCampos();
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
      TextInputType keyboardType,
      {List<TextInputFormatter>? inputFormatters}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: _buildInputDecoration(label),
      style: TextStyle(color: Colors.black),
    );
  }

  void validarCampos() {
    if (_nomeController.text.isEmpty) {
      _exibirModalErro("O campo Nome deve ser preenchido.");
    } else if (_descricaoController.text.isEmpty) {
      _exibirModalErro("O campo Descrição deve ser preenchido.");
    } else if (_precoController.text.isEmpty) {
      _exibirModalErro("O campo Preço deve ser preenchido.");
    } else if (_quantidadeController.text.isEmpty) {
      _exibirModalErro("O campo Quantidade deve ser preenchido.");
    } else {
      Navigator.pop(context, {
        'nome': _nomeController.text,
        'descricao': _descricaoController.text,
        'preco': double.parse(_precoController.text),
        'quantidade': int.parse(_quantidadeController.text),
      });
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
