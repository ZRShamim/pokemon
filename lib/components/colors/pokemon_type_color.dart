import 'package:flutter/animation.dart';

class PokemonTypeColor {
  static const Color bug = Color(0xffAFC836);
  static const Color dark = Color(0xff9298A4);
  static const Color dragon = Color(0xff0180C7);
  static const Color electric = Color(0xffFBE273);
  static const Color fairy = Color(0xffF3A7E7);
  static const Color fighting = Color(0xffE74347);
  static const Color fire = Color(0xffFBAE46);
  static const Color flying = Color(0xffA6C2F2);
  static const Color ghost = Color(0xff7773D4);
  static const Color grass = Color(0xff5AC178);
  static const Color ground = Color(0xffD29463);
  static const Color ice = Color(0xff8CDDD4);
  static const Color normal = Color(0xffA3A49E);
  static const Color poison = Color(0xffC261D4);
  static const Color psychic = Color(0xffFE9F92);
  static const Color rock = Color(0xffD7CD90);
  static const Color steel = Color(0xff58A6AA);
  static const Color water = Color(0xff6CBDE4);

  static Color getTypeColor({required String type}) {
    if (type == 'fighting') {
      return PokemonTypeColor.fighting;
    } else if (type == 'flying') {
      return PokemonTypeColor.flying;
    } else if (type == 'poison') {
      return PokemonTypeColor.poison;
    } else if (type == 'ground') {
      return PokemonTypeColor.ground;
    } else if (type == 'rock') {
      return PokemonTypeColor.rock;
    } else if (type == 'bug') {
      return PokemonTypeColor.bug;
    } else if (type == 'ghost') {
      return PokemonTypeColor.ghost;
    } else if (type == 'steel') {
      return PokemonTypeColor.steel;
    } else if (type == 'fire') {
      return PokemonTypeColor.fire;
    } else if (type == 'water') {
      return PokemonTypeColor.water;
    } else if (type == 'grass') {
      return PokemonTypeColor.grass;
    } else if (type == 'electric') {
      return PokemonTypeColor.electric;
    } else if (type == 'psychic') {
      return PokemonTypeColor.psychic;
    } else if (type == 'ice') {
      return PokemonTypeColor.ice;
    } else if (type == 'dragon') {
      return PokemonTypeColor.dragon;
    } else if (type == 'dark') {
      return PokemonTypeColor.dark;
    } else if (type == 'fairy') {
      return PokemonTypeColor.fairy;
    } else {
      return PokemonTypeColor.normal;
    }
  }
}
