import 'package:get/get.dart';
import 'package:poke_api/view/main_pages/pokedex/pokedex.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String pokedexScreen = '/pokedexScreen';
  static const String pokemonInfoScreen = '/pokemonInfoScreen';
  static var routeList = [
    // GetPage(
    //   name: splashScreen,
    //   page: () =>,
    //   // binding: ,
    // ),
    GetPage(
      name: pokedexScreen,
      page: () => Pokedex(),
      // binding: ,
    ),
    GetPage(
      name: pokemonInfoScreen,
      page: () => Pokedex(),
      // binding: ,
    ),
    // GetPage(
    //   name: splashScreen,
    //   page: () =>,
    //   // binding: ,
    // ),
  ];
}
