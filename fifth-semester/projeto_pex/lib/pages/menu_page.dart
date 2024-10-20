import 'package:flutter/material.dart';
import 'package:projeto_pex/pages/exibir_pedidos.dart';
import 'package:projeto_pex/pages/exibir_produtos.dart';
import 'package:projeto_pex/pages/login_page.dart';

class MenuPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MenuPage({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFE5CDAE),
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo-menor.png',
              height: 70,
              width: 70,
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.brown),
              iconSize: 34,
              onPressed: () {
                _showMenuList(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showMenuList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height - 105,
                decoration: BoxDecoration(
                  color: Color(0xFFF3E6D4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.chevron_right,
                          color: Color(0xFF7D5638), size: 24),
                      title: Text('Pedidos'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExibirPedidos()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.chevron_right,
                          color: Color(0xFF7D5638), size: 24),
                      title: Text('Produtos'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExibirProdutos()),
                        );                      },
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.exit_to_app, color: Color(0xFF7D5638)),
                      title: Text('Sair'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
