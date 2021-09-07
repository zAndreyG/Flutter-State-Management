import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_1/app/pages/home/home_controller.dart';

class OtherPage extends StatefulWidget {
  OtherPage({Key? key}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  final homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other'),
      ),
      body: Center(
        child: Text(homeController.text),
      ),
    );
  }
}
