import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/adicionar_editar_pedidos.dart';
import 'package:projeto_pex/pages/menu_page.dart';

class ExibirPedidos extends StatefulWidget {
  @override
  _ExibirPedidosState createState() => _ExibirPedidosState();
}

class _ExibirPedidosState extends State<ExibirPedidos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> _pedidos = [];
  @override
  Widget build(BuildContext context) {
    final TextEditingController _filtroBuscaController =
        TextEditingController();

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
                              builder: (context) => AdicionarEditarPedidos()),
                        );
                        if (pedido != null) {
                          setState(() {
                            _pedidos.add(pedido);
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    icon: Icon(Icons.filter_alt_outlined),
                    color: Color(0xFF7D5638),
                    iconSize: 50,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              ..._pedidos
                  .map((pedido) => _buildOrderContainer(pedido))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderContainer(Map<String, dynamic> pedido) {
    double total = 0;

    pedido['itens'].forEach((item) {
      total += item['quantidade'] * item['preco'];
    });

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF7D5638), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pedido['nome'],
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF7D5638),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.create_outlined,
                      color: Color(0xFF7D5638),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pedidos.remove(pedido);
                      });
                    },
                    child: Icon(
                      Icons.restore_from_trash,
                      color: Color(0xFF7D5638),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(
            pedido['telefone'],
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7D5638),
            ),
          ),
          SizedBox(height: 2),
          Text(
            pedido['data'],
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7D5638),
            ),
          ),
          SizedBox(height: 20),
          ...pedido['itens'].map<Widget>((item) {
            return _buildProductRow(
                item['produto'], item['quantidade'], item['preco']);
          }).toList(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                'TOTAL: R\$ ${total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF7D5638),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductRow(String productName, int quantity, double price) {
    double totalPrice = quantity * price;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 16, color: Color(0xFFCA7755)),
                  ),
                  Text(
                    'Quantidade: $quantity',
                    style: TextStyle(fontSize: 12, color: Color(0xFFCA7755)),
                  ),
                ],
              ),
            ),
            Text(
              'R\$ ${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Color(0xFF7D5638)),
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
