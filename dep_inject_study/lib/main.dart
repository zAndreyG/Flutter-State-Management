import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

void main() async {
  // IHttpService com Dio
  final dio = Dio();
  final dioService = DioService(dio);

  // IHttpService com Http
  final client = http.Client();
  final httpService = HttpService(client);

  final product = Product(dioService);

  final list = await product.fetchProducts();
  print(list);
}

// Classe Product -> recebe a implementação da Interface e faz
// a requisição à partir dela
class Product {
  final IHttpService service;

  Product(this.service);

  Future<List> fetchProducts() async {
    final response =
        await service.get('https://jsonplaceholder.typicode.com/todos/');
    return response;
  }
}

// Interface
abstract class IHttpService {
  Future<dynamic> get(String url);
}

// Iplementação da Interface com Dio
class DioService implements IHttpService {
  final Dio dio;

  DioService(this.dio);

  @override
  Future get(String url) async => (await dio.get(url)).data;
}

// Iplementação da Interface com Http
class HttpService implements IHttpService {
  final http.Client client;

  HttpService(this.client);

  @override
  Future get(String url) async =>
      jsonDecode((await client.get(Uri.parse(url))).body);
}
