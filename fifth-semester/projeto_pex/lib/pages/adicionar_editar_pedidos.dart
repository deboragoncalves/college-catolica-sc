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
  List<String> _produtos = [];
  List<Map<String, dynamic>> _itens = [];

  String? _statusSelecionado;
  List<String> _statusOptions = ["Pedido feito", "Pedido entregue"];

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
      _nomeOriginal = widget.pedido!['nome'];
    }
    _carregarProdutos();
  }

  Future<void> _carregarProdutos() async {
    QuerySnapshot produtosSnapshot =
    await FirebaseFirestore.instance.collection('produtos').get();
    setState(() {
      _produtos = produtosSnapshot.docs.map((doc) {
        return doc['codigo'] as String;
      }).toList();
    });
  }

  void _salvarPedido() async {
    if (_itens.isNotEmpty) {
      String nomePedido = _nomeController.text.trim();
      var querySnapshot = await FirebaseFirestore.instance
          .collection('pedidos')
          .where('nome', isEqualTo: nomePedido)
          .get();

      if (querySnapshot.docs.isNotEmpty && _nomeOriginal != nomePedido) {
        _exibirModalErro("Já existe um pedido com esse nome.");
        return;
      }

      Map<String, dynamic> pedido = {
        'nome': nomePedido,
        'telefone': _telefoneController.text.trim(),
        'email': _emailController.text.trim(),
        'data': _dataController.text.trim(),
        'status': _statusSelecionado,
        'itens': _itens,
      };

      try {
        // Atualiza a quantidade dos produtos no estoque
        for (var item in _itens) {
          String produtoId = item['produto'];
          int quantidadePedido = item['quantidade'];

          // Busca o documento do produto no Firestore
          DocumentReference produtoRef = FirebaseFirestore.instance
              .collection('produtos')
              .doc(produtoId);

          DocumentSnapshot produtoSnapshot = await produtoRef.get();
          if (produtoSnapshot.exists) {
            int quantidadeEstoque = produtoSnapshot['quantidade'];

            // Verifica se a quantidade no estoque é suficiente
            if (quantidadeEstoque >= quantidadePedido) {
              // Atualiza a quantidade do produto no estoque
              int novaQuantidade = quantidadeEstoque - quantidadePedido;
              await produtoRef.update({'quantidade': novaQuantidade});
            } else {
              _exibirModalErro(
                  "Estoque insuficiente para o produto $produtoId. Quantidade disponível: $quantidadeEstoque.");
              return; // Interrompe a execução se o estoque for insuficiente
            }
          } else {
            _exibirModalErro("Produto $produtoId não encontrado no estoque.");
            return;
          }
        }

        // Salva o pedido no Firestore
        if (_nomeOriginal != null && _nomeOriginal != nomePedido) {
          await FirebaseFirestore.instance
              .collection('pedidos')
              .doc(_nomeOriginal)
              .delete();
        }

        await FirebaseFirestore.instance
            .collection('pedidos')
            .doc(nomePedido)
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
                              Text("R\$ ${item['preco']}/un",
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
      labelStyle: TextStyle(color: Color(0xFF7D5638)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF7D5638)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF7D5638)),
      ),
    );
  }

  TextField _buildTextField(
      TextEditingController controller,
      String label, {
        TextInputType keyboardType = TextInputType.text,
      }) {
    return TextField(
      controller: controller,
      decoration: _buildInputDecoration(label),
      style: TextStyle(color: Color(0xFF7D5638)),
      keyboardType: keyboardType,
    );
  }

  void validarCampos() async {
    if (_produtoSelecionado != null && _quantidadeController.text.isNotEmpty) {
      int quantidadeSelecionada = int.parse(_quantidadeController.text);

      // Consulta a quantidade disponível do produto selecionado
      DocumentSnapshot produtoSnapshot = await FirebaseFirestore.instance
          .collection('produtos')
          .doc(_produtoSelecionado)
          .get();

      if (produtoSnapshot.exists) {
        int quantidadeEstoque = produtoSnapshot['quantidade'];

        // Verifica se a quantidade selecionada é maior que a disponível
        if (quantidadeSelecionada > quantidadeEstoque) {
          _exibirModalErro(
              "A quantidade selecionada excede o estoque disponível. Estoque disponível: $quantidadeEstoque."
          );
          return; // Para a execução se a quantidade for maior que o estoque
        }

        // Adiciona o item ao pedido se a quantidade for válida
        _itens.add({
          'produto': _produtoSelecionado!,
          'quantidade': quantidadeSelecionada,
          'preco': produtoSnapshot['preco'].toDouble()
        });

        // Limpa os campos de entrada
        _produtoSelecionado = null;
        _quantidadeController.clear();
        setState(() {});
      } else {
        _exibirModalErro("Produto não encontrado no estoque.");
      }
    } else {
      _exibirModalErro("Selecione um produto e informe a quantidade.");
    }
  }

  void _exibirModalErro(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erro"),
          content: Text(mensagem),
          actions: [
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
}
