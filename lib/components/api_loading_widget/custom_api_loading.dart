import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_api/components/assets.dart';

class CustomApiLoading extends StatelessWidget {
  const CustomApiLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.pokeballLoadingAnimation,
            height: 70,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Loading...'),
        ],
      ),
    );
  }
}
