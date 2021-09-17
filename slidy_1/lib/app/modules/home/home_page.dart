import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Observer(
        builder: (_) {
          if (homeController.pokemons!.error != null)
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Erro ao carregar Pokemons'),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => homeController.fetchPokemon(),
                    child: Text('Tentar Novamente'))
              ],
            ));

          if (homeController.pokemons!.result == null)
            return Center(child: CircularProgressIndicator());

          var list = homeController.pokemons!.value;

          return ListView.builder(
            itemCount: list!.length,
            itemBuilder: (context, index) =>
                ListTile(title: Text(list[index].name)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context).pushNamed('/other/${homeController.text}');
          Modular.to.pushNamed('/other');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
