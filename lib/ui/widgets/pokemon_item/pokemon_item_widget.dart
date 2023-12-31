import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poke_demo/data/models/pokemon_model.dart';

class PokemonItemWidget extends ConsumerWidget {
  final PokemonModel pokemon;
  const PokemonItemWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          height: 152,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pokemon.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Hero(
                  tag: pokemon.url,
                  child: SvgPicture.network(
                    pokemon.url,
                    width: 125,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}