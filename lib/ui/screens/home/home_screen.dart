import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_demo/data/models/pokemon_model.dart';
import 'package:poke_demo/ui/widgets/pokemon_list/pokemon_list_widget.dart';
import 'package:poke_demo/view_models/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(pokemonViewModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                model.when(
                    data: (data) {
                      final pokemonList = data as List<PokemonModel>;
                      if (pokemonList.isEmpty) {
                        return const Text('SIN DATOS');
                      }
                      return Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          PokemonListWidget(pokemonList: pokemonList)
                        ],
                      );
                    },
                    error: (error) {
                      return Text(error);
                    },
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
