import 'dart:convert';

import 'package:poke_demo/core/utils/constants.dart';
import 'package:poke_demo/core/utils/network_helper.dart';
import 'package:poke_demo/data/models/pokemon_model.dart';
import 'package:poke_demo/data/repositories/pokemon_repository/ipokemon_repository.dart';

class PokemonRepository extends IPokemonRepository {

  final networkHelper = NetworkHelper();

  static const String pokemonUrl = '${Constants.urlBase}?limit=151';

  @override
  Future<List<PokemonModel>> getPokemons() async {
   List<PokemonModel> pokemonList = [];
    return networkHelper
        .get(
      pokemonUrl,
    )
        .then((response) {
      List<Map<String, dynamic>> data = List.from(json.decode(response.body)['results']);
      pokemonList = data.asMap().entries.map<PokemonModel>((element) {
        element.value['img'] = "${Constants.urlImageBase}${element.key + 1}.svg";
        element.value['id'] = element.key;
        return PokemonModel.fromMap(element.value);
      }).toList();
      return pokemonList;
    });
  }
}