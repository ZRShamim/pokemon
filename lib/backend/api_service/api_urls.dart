import 'package:poke_api/backend/api_components/configuration.dart';

class ApiUrls {
  // Pokemon
  static const String ability = '${ApiConfiguration.baseUrl}/ability/';
  static const String characteristic =
      '${ApiConfiguration.baseUrl}/characteristic/';
  static const String eggGroup = '${ApiConfiguration.baseUrl}/egg-group/';
  static const String gender = '${ApiConfiguration.baseUrl}/gender/';
  static const String growthRate = '${ApiConfiguration.baseUrl}/growth-rate/';
  static const String nature = '${ApiConfiguration.baseUrl}/nature/';
  static const String pokeathlonStat =
      '${ApiConfiguration.baseUrl}/pokeathlon-stat/';
  static const String encounters = '/encounters';
  static const String pokemonColor =
      '${ApiConfiguration.baseUrl}/pokemon-color/';
  static const String pokemonForm = '${ApiConfiguration.baseUrl}/pokemon-form/';
  static const String pokemonHabitat =
      '${ApiConfiguration.baseUrl}/pokemon-habitat/';
  static const String pokemonShape =
      '${ApiConfiguration.baseUrl}/pokemon-shape/';
  static const String pokemonSpecies =
      '${ApiConfiguration.baseUrl}/pokemon-species/';
  static const String stat = '${ApiConfiguration.baseUrl}/stat/';
  static const String type = '${ApiConfiguration.baseUrl}/type/';

  // Utils
  static const String language = '${ApiConfiguration.baseUrl}/language/';

  // Berries
  static const String berry = '${ApiConfiguration.baseUrl}/berry/';
  static const String berryFirmness =
      '${ApiConfiguration.baseUrl}/berry-firmness/';
  static const String berryFlavor = '${ApiConfiguration.baseUrl}/berry-flavor/';

  // Contests
  static const String contestType = '${ApiConfiguration.baseUrl}/contest-type/';
  static const String contestEffect =
      '${ApiConfiguration.baseUrl}/contest-effect/';
  static const String superContestEffect =
      '${ApiConfiguration.baseUrl}/super-contest-effect/';

  // Encounters
  static const String encounterMethod =
      '${ApiConfiguration.baseUrl}/encounter-method/';
  static const String encounterCondition =
      '${ApiConfiguration.baseUrl}/encounter-condition/';
  static const String encounterConditionValue =
      '${ApiConfiguration.baseUrl}/encounter-condition-value/';

  // Evolution
  static const String evolutionChain =
      '${ApiConfiguration.baseUrl}/evolution-chain/';
  static const String evolutionTrigger =
      '${ApiConfiguration.baseUrl}/evolution-trigger/';

  // Games
  static const String generation = '${ApiConfiguration.baseUrl}/generation/';
  static const String pokedex = '${ApiConfiguration.baseUrl}/pokedex/';
  static const String version = '${ApiConfiguration.baseUrl}/version/';
  static const String versionGroup =
      '${ApiConfiguration.baseUrl}/version-group/';

  // Item
  static const String item = '${ApiConfiguration.baseUrl}/item/';
  static const String itemAttribute =
      '${ApiConfiguration.baseUrl}/item-attribute/';
  static const String itemCategory =
      '${ApiConfiguration.baseUrl}/item-category/';
  static const String itemFlingEffect =
      '${ApiConfiguration.baseUrl}/item-fling-effect/';
  static const String itemPocket = '${ApiConfiguration.baseUrl}/item-pocket/';

  // Locations
  static const String location = '${ApiConfiguration.baseUrl}/location/';
  static const String locationArea =
      '${ApiConfiguration.baseUrl}/location-area/';
  static const String palParkArea =
      '${ApiConfiguration.baseUrl}/pal-park-area/';
  static const String region = '${ApiConfiguration.baseUrl}/region/';

  // Machines
  static const String machine = '${ApiConfiguration.baseUrl}/machine/';

  // Moves
  static const String move = '${ApiConfiguration.baseUrl}/move/';
  static const String moveAilment = '${ApiConfiguration.baseUrl}/move-ailment/';
  static const String moveBattleStyle =
      '${ApiConfiguration.baseUrl}/move-battle-style/';
  static const String moveCategory =
      '${ApiConfiguration.baseUrl}/move-category/';
  static const String moveDamageClass =
      '${ApiConfiguration.baseUrl}/move-damage-class/';
  static const String moveLearnMethod =
      '${ApiConfiguration.baseUrl}/move-learn-method/';
  static const String moveTarget = '${ApiConfiguration.baseUrl}/move-target/';
}
