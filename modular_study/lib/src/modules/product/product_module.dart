import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_study/src/modules/product/views/list_product_page.dart';
import 'package:modular_study/src/modules/product/views/product_page.dart';

class ProductModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => ProductPage(), children: [
          ChildRoute('/red',
              child: (_, __) => Container(color: Colors.red),
              transition: TransitionType.noTransition),
          ChildRoute('/blue',
              child: (_, __) => Container(color: Colors.blue),
              transition: TransitionType.noTransition),
          ChildRoute('/yellow',
              child: (_, __) => Container(color: Colors.yellow),
              transition: TransitionType.noTransition),
        ]),
        ChildRoute('/list',
            child: (_, args) => ListProductPage(id: args.data ?? ''),
            transition: TransitionType.downToUp,
            duration: Duration(seconds: 2)),
      ];
}

// Passar parâmetros via "url"
/* ChildRoute('/list/:id',
            child: (_, args) => ListProductPage(
                  id: args.params['id'] ?? '',
                )) */
