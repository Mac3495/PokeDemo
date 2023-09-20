import 'package:poke_demo/data/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<List<PokemonModel>> getPokemons();
}