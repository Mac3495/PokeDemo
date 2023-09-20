import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_demo/core/states/get_data_state.dart';
import 'package:poke_demo/core/utils/app_provider.dart';
import 'package:poke_demo/data/repositories/pokemon_repository/ipokemon_repository.dart';

final pokemonViewModel = StateNotifierProvider<HomeViewModel, GetDataState>((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  return HomeViewModel(pokemonRepository: pokemonRepository);
});

class HomeViewModel extends StateNotifier<GetDataState> {
  final IPokemonRepository pokemonRepository;

  HomeViewModel({required this.pokemonRepository}) : super(const GetDataState.loading()) {
    loadSpecies();
  }

  Future<void> loadSpecies() async {
    try {
      final response = await pokemonRepository.getPokemons();
      state = GetDataState.data(response);
    } catch (e) {
      state = const GetDataState.error('Whoops, an unexpected error occurred, please try again');
    }
  }
}
