import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/adicionar_editar_pedidos.dart';
import 'package:projeto_pex/pages/menu_page.dart';

class ExibirPedidos extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdicionarEditarPedidos()),
                        );
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
              ...List.generate(5, (index) => _buildOrderContainer()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderContainer() {
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
                'Jose',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF7D5638),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: Icon(
                      Icons.create_outlined,
                      color: Color(0xFF7D5638),
                      size: 30
                    ),
                  ),
                  SizedBox(width: 8), 
                  GestureDetector(
                    onTap: () {
                    },
                    child: Icon(
                      Icons.restore_from_trash,
                      color: Color(0xFF7D5638),
                      size: 30
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(
            '(47) 99999-9999',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7D5638),
            ),
          ),
          SizedBox(height: 2),
          Text(
            '11/10/2024',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7D5638),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 150,
            child: ListView(
              children: [
                _buildProductRow('Produto 1', 5, 10.00),
                SizedBox(height: 15),
                _buildProductRow('Produto 2', 10, 15.00),
                SizedBox(height: 15),
                _buildProductRow('Produto 3', 20, 20.00),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                'TOTAL: R\$ 45.00',
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
    return Row(
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
          'R\$ ${price.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 16, color: Color(0xFF7D5638)),
        ),
      ],
    );
  }
}
