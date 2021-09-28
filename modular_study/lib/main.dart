import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_study/src/app_module.dart';
import 'package:modular_study/src/app_widget.dart';

void main() {
  Modular.to.addListener(() => print(Modular.to.path));

  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
