import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_api/components/colors/custom_color.dart';
import 'package:poke_api/controllers/pokedex/pokedex_controller.dart';

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
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.pokemon.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network(
                        controller.pokemon[index].sprites.frontDefault,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(controller.pokemon[index].name),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
