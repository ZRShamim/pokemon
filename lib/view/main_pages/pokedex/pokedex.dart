import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_api/components/api_loading_widget/custom_api_loading.dart';
import 'package:poke_api/components/colors/custom_color.dart';
import 'package:poke_api/components/routes/routes.dart';
import 'package:poke_api/controllers/pokedex/pokedex_controller.dart';
import 'package:poke_api/view/main_pages/pokedex/pokemon_card.dart';

class Pokedex extends StatelessWidget {
  Pokedex({super.key});
  final PokedexController controller = Get.put(PokedexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainBG,
      body: Obx(
        () => controller.isLoading.value
            ? const CustomApiLoading()
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
                      onTap: () {
                        Get.toNamed(
                          Routes.pokemonInfoScreen,
                          arguments: controller.pokemon[index],
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
