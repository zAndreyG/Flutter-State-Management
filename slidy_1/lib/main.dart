import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_1/app/app.module.dart';
import 'package:slidy_1/app/app_widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
