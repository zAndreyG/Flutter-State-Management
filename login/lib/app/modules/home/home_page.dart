import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/modules/home/components/item_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setText,
        ),
        actions: [
          Observer(builder: (_) {
            return IconButton(
              icon: Icon(Icons.add),
              onPressed: controller.text.isEmpty ? null : controller.save,
            );
          })
        ],
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (_, index) => ItemWidget(index: index),
        ),
      ),
    );
  }
}
