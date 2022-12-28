import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_api/components/assets.dart';
import 'package:poke_api/components/styles.dart';
import 'package:poke_api/model/pokemon_info_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);

  final PokemonInfoModel pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 120,
        width: 100,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Text(
              "#${pokemon.order.toString()}",
              style: CustomStyles.pokemonIndex,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        for (var i = 0; i < pokemon.types.length; i++)
                          Image.asset(
                            Assets.getTypeAssets(
                              type: pokemon.types[i].type.name,
                            ),
                            width: 30,
                            height: 30,
                          ),
                      ],
                    ),
                    Hero(
                      transitionOnUserGestures: true,
                      tag: pokemon.name,
                      child: Image.network(
                        pokemon.sprites.other!.home.frontDefault,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Center(
                    child: Text(
                      pokemon.name.toString().capitalize!,
                      style: CustomStyles.pokemonName,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
