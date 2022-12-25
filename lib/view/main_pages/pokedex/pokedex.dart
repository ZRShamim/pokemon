import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_api/components/assets.dart';
import 'package:poke_api/components/colors/custom_color.dart';
import 'package:poke_api/components/styles.dart';
import 'package:poke_api/controllers/pokedex/pokedex_controller.dart';
import 'package:poke_api/model/pokemon_info_model.dart';

class Pokedex extends StatelessWidget {
  Pokedex({super.key});
  final PokedexController controller = Get.put(PokedexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainBG,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: CustomColor.black,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: controller.pokemon.length,
                  itemBuilder: (context, index) {
                    return PokemonCard(
                      pokemon: controller.pokemon[index],
                    );
                  },
                ),
              ),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonInfoModel pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  Image.network(
                    pokemon.sprites.other!.home.frontDefault,
                    height: 70,
                    width: 70,
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
    );
  }
}
