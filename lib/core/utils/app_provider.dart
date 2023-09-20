import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_demo/data/repositories/pokemon_repository/ipokemon_repository.dart';
import 'package:poke_demo/data/repositories/pokemon_repository/pokemon_repository.dart';

final pokemonRepositoryProvider = Provider<IPokemonRepository>((ref) {
  return PokemonRepository();
});