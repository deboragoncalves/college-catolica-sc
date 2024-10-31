import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/menu_page.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter/services.dart';

class AdicionarEditarPedidos extends StatefulWidget {
  final Map<String, dynamic>? pedido;

  AdicionarEditarPedidos({this.pedido});

  @override
  _AdicionarEditarPedidosState createState() => _AdicionarEditarPedidosState();
}

class _AdicionarEditarPedidosState extends State<AdicionarEditarPedidos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _telefoneController =
      MaskedTextController(mask: '(00) 00000-0000');
  final TextEditingController _dataController =
      MaskedTextController(mask: '00/00/0000');

  String? _produtoSelecionado;
  List<String> _produtos = ["Produto 1", "Produto 2", "Produto 3"];
  List<Map<String, dynamic>> _itens = [];

  String? _statusSelecionado;
  List<String> _statusOptions = ["Pedido feito", "Pedido entregue"];

  // Variável para armazenar o nome original
  String? _nomeOriginal;

  @override
  void initState() {
    super.initState();
    if (widget.pedido != null) {
      _nomeController.text = widget.pedido!['nome'];
      _telefoneController.text = widget.pedido!['telefone'];
      _emailController.text = widget.pedido!['email'];
      _dataController.text = widget.pedido!['data'];
      _statusSelecionado = widget.pedido!['status'];
      _itens = List<Map<String, dynamic>>.from(widget.pedido!['itens']);

      // Armazenar o nome original do pedido para verificar alterações
      _nomeOriginal = widget.pedido!['nome'];
    }
  }

  void _salvarPedido() async {
    if (_itens.isNotEmpty) {
      Map<String, dynamic> pedido = {
        'nome': _nomeController.text,
        'telefone': _telefoneController.text,
        'email': _emailController.text,
        'data': _dataController.text,
        'status': _statusSelecionado,
        'itens': _itens,
      };

      try {
        // Verificar se o nome foi alterado
        if (_nomeOriginal != null && _nomeOriginal != _nomeController.text) {
          // Excluir o pedido com o nome original
          await FirebaseFirestore.instance
              .collection('pedidos')
              .doc(_nomeOriginal)
              .delete();
        }

        // Salvar o pedido com o novo nome
        await FirebaseFirestore.instance
            .collection('pedidos')
            .doc(_nomeController.text)
            .set(pedido);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Pedido salvo com sucesso!")),
        );

        Navigator.pop(context, pedido);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao salvar o pedido: $e")),
        );
      }
    } else {
      _exibirModalErro("Adicione pelo menos um item.");
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
              "PEDIDO",
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
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _statusSelecionado,
                            decoration: _buildInputDecoration("Status"),
                            items: _statusOptions.map((String status) {
                              return DropdownMenuItem<String>(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                            onChanged: (String? novoStatus) {
                              setState(() {
                                _statusSelecionado = novoStatus;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: _buildTextField(_dataController, 'Data',
                              keyboardType: TextInputType.datetime),
                        )
                      ],
                    ),
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
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0xFF7D5638), width: 2),
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
                              Text("01",
                                  style: TextStyle(color: Color(0xFF7D5638))),
                              Text(item['produto'],
                                  style: TextStyle(color: Color(0xFF7D5638))),
                              Text("${item['quantidade']} un",
                                  style: TextStyle(color: Color(0xFF7D5638))),
                              Text("R\$ 10,00/un",
                                  style: TextStyle(color: Color(0xFF7D5638))),
                              IconButton(
                                icon: Icon(Icons.restore_from_trash,
                                    color: Color(0xFF7D5638)),
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
                onPressed: _salvarPedido,
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
    } else if (_telefoneController.text.isEmpty ||
        _telefoneController.text.length != 15) {
      _exibirModalErro(
          "O campo Telefone deve estar no formato (00) 00000-0000.");
    } else if (!isEmailValid) {
      _exibirModalErro('Email inválido. Verifique se tem "@" e ".".');
    } else if (_dataController.text.isEmpty ||
        _dataController.text.length != 10) {
      _exibirModalErro("O campo Data deve estar no formato dd/MM/yyyy.");
    } else if (_produtoSelecionado == null) {
      _exibirModalErro("O campo Produto deve ser preenchido.");
    } else if (_quantidadeController.text.isEmpty ||
        int.tryParse(_quantidadeController.text) == null ||
        int.parse(_quantidadeController.text) <= 0) {
      _exibirModalErro("Informe uma quantidade válida.");
    } else if (_statusSelecionado == null) {
      _exibirModalErro("O campo Status deve ser preenchido.");
    } else {
      setState(() {
        _itens.add({
          'produto': _produtoSelecionado!,
          'quantidade': int.parse(_quantidadeController.text),
          // ajustar preco
          'preco': double.parse('10')
        });
        _produtoSelecionado = null;
        _quantidadeController.clear();
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
