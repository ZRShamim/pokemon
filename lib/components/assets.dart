class Assets {
  static const String bug = 'assets/type_component/TypeBug.png';
  static const String dark = 'assets/type_component/TypeDark.png';
  static const String dragon = 'assets/type_component/TypeDragon.png';
  static const String electric = 'assets/type_component/TypeElectric.png';
  static const String fairy = 'assets/type_component/TypeFairy.png';
  static const String fighting = 'assets/type_component/TypeFighting.png';
  static const String fire = 'assets/type_component/TypeFire.png';
  static const String flying = 'assets/type_component/TypeFlying.png';
  static const String ghost = 'assets/type_component/TypeGhost.png';
  static const String grass = 'assets/type_component/TypeGrass.png';
  static const String ground = 'assets/type_component/TypeGround.png';
  static const String ice = 'assets/type_component/TypeIce.png';
  static const String normal = 'assets/type_component/TypeNormal.png';
  static const String poison = 'assets/type_component/TypePoison.png';
  static const String psychic = 'assets/type_component/TypePsychic.png';
  static const String rock = 'assets/type_component/TypeRock.png';
  static const String steel = 'assets/type_component/TypeSteel.png';
  static const String water = 'assets/type_component/TypeWater.png';

  static const String pokeballLoadingAnimation =
      'assets/lottie/pokeball-loading-animation.json';

  static String getTypeAssets({required String type}) {
    if (type == 'fighting') {
      return Assets.fighting;
    } else if (type == 'flying') {
      return Assets.flying;
    } else if (type == 'poison') {
      return Assets.poison;
    } else if (type == 'ground') {
      return Assets.ground;
    } else if (type == 'rock') {
      return Assets.rock;
    } else if (type == 'bug') {
      return Assets.bug;
    } else if (type == 'ghost') {
      return Assets.ghost;
    } else if (type == 'steel') {
      return Assets.steel;
    } else if (type == 'fire') {
      return Assets.fire;
    } else if (type == 'water') {
      return Assets.water;
    } else if (type == 'grass') {
      return Assets.grass;
    } else if (type == 'electric') {
      return Assets.electric;
    } else if (type == 'psychic') {
      return Assets.psychic;
    } else if (type == 'ice') {
      return Assets.ice;
    } else if (type == 'dragon') {
      return Assets.dragon;
    } else if (type == 'dark') {
      return Assets.dark;
    } else if (type == 'fairy') {
      return Assets.fairy;
    } else {
      return Assets.normal;
    }
  }
}
