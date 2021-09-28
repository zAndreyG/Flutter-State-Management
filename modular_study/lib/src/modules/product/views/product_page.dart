import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              children: [
                ListTile(
                  title: Text('Red'),
                  onTap: () => Modular.to.navigate('./red'),
                ),
                ListTile(
                  title: Text('Blue'),
                  onTap: () => Modular.to.navigate('./blue'),
                ),
                ListTile(
                  title: Text('Yellow'),
                  onTap: () => Modular.to.navigate('./yellow'),
                )
              ],
            ),
          ),
          Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }
}

//1:57:25

// Passar parâmetros via "url"
// Modular.to.pushNamed('./list/2')


/* Center(
  child: ElevatedButton(
    child: Text('Listar Produtos'),
    onPressed: () => Modular.to.pushNamed('./list', arguments: '6'),
  ),
), */