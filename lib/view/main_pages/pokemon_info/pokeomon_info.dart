import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_api/components/assets.dart';
import 'package:poke_api/components/colors/custom_color.dart';
import 'package:poke_api/components/colors/pokemon_type_color.dart';
import 'package:poke_api/components/styles.dart';
import 'package:poke_api/model/pokemon_info_model.dart';

class PokemonInfo extends StatelessWidget {
  PokemonInfo({super.key});
  final PokemonInfoModel info = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainBG,
      // PokemonTypeColor.getTypeColor(
      //   type: info.types[0].type.name,
      // ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: PokemonTypeColor.getTypeColor(
                      type: info.types[0].type.name,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -30,
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: info.name,
                  child: Image.network(
                    info.sprites.other!.home.frontDefault,
                    height: 280,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: CustomColor.white,
                        ),
                        label: Text(
                          'Pokedex',
                          style: CustomStyles.poppins16WhiteNormal,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star_outline,
                          color: CustomColor.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          info.name.toString().capitalize!,
                          style: CustomStyles.noto20WhiteExtraBold,
                        ),
                        Text(
                          '#${info.order.toString().padLeft(3, '0')}',
                          style: CustomStyles.noto16WhiteBold,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < info.types.length; i++)
                Row(
                  children: [
                    // Image.asset(
                    //   Assets.getTypeAssets(type: info.types[i].type.name),
                    // ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: PokemonTypeColor.getTypeColor(
                              type: info.types[i].type.name,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              info.types[i].type.name.toString().capitalize!,
                              style: CustomStyles.noto14WhiteNormal,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -25,
                          left: -15,
                          child: Image.asset(
                            Assets.getTypeAssets(type: info.types[i].type.name),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    // print(h);
    // print(w);

    final path = Path();
    path.lineTo(0, h - 60);
    path.quadraticBezierTo(w * 0.5, h, w, h - 60);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
