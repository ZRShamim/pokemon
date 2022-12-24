import 'package:flutter/material.dart';
import 'package:poke_api/backend/api_service/api_method.dart';
import 'package:poke_api/backend/api_service/api_urls.dart';
import 'package:poke_api/components/custom_snackbar/custom_snackbar.dart';
import 'package:poke_api/model/pokemon_info_model.dart';
import 'package:poke_api/model/pokemons_model.dart';

class ApiServices {
  static Future<PokemonsModel?> getPokemons({required String limit}) async {
    Map<String, dynamic>? mapResponse;

    try {
      mapResponse = await ApiMethod().paramGet(ApiUrls.pokemons, {
        'limit': limit,
      });
      if (mapResponse != null) {
        PokemonsModel pokemonsModel = PokemonsModel.fromJson(mapResponse);
        CustomSnackBar.success('Success');
        return pokemonsModel;
      }
    } catch (e) {
      debugPrint('err from get Pokemons api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  static Future<PokemonInfoModel?> getPokemon(String name) async {
    Map<String, dynamic>? mapResponse;

    try {
      mapResponse =
          await ApiMethod().get('${ApiUrls.pokemons}/$name', code: 200);
      if (mapResponse != null) {
        PokemonInfoModel pokemonInfoModel =
            PokemonInfoModel.fromJson(mapResponse);
        // CustomSnackBar.success('Success');
        return pokemonInfoModel;
      }
    } catch (e) {
      debugPrint('err from get Pokemon api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
