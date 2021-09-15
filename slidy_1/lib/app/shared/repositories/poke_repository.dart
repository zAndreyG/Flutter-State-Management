import 'package:dio/dio.dart';
import 'package:slidy_1/app/shared/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = [];

    for (var json in (response.data['results'] as List)) {
      PokemonModel model = PokemonModel(json['name'], json['url']);
      list.add(model);
    }

    return list;
  }
}
