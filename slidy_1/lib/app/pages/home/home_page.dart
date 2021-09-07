import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_1/app/pages/home/home_controller.dart';

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
      body: Center(
        child: TextField(
          decoration: InputDecoration(labelText: 'Um texto'),
          onChanged: (value) {
            homeController.text = value;
          },
        ),
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
