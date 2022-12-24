import 'package:get/get.dart';
import 'package:poke_api/backend/api_service/api_service.dart';
import 'package:poke_api/model/pokemon_info_model.dart';

class PokedexController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<PokemonInfoModel> pokemon = <PokemonInfoModel>[].obs;

  @override
  void onInit() {
    fetchPokemons();
    super.onInit();
  }

  Future fetchPokemons() async {
    isLoading.value = true;
    ApiServices.getPokemons(limit: '151').then((value) async {
      if (value != null) {
        for (var i = 0; i < value.results.length; i++) {
          ApiServices.getPokemon(value.results[i].name).then((info) {
            if (info != null) {
              pokemon.add(info);
            } else {
              return;
            }
          });
        }
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    });
  }
}
