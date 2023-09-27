import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/neopop.dart';
import 'package:travell_apps/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.amber.shade400,
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
        ),
        Positioned(
            top: 0,
            right: -(MediaQuery.sizeOf(context).width * .3),
            width: MediaQuery.sizeOf(context).width,
            child: Opacity(
              opacity: .3,
              child: Image.asset('public/assets/images/poke-ball.png'),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Pokédex',
                style: GoogleFonts.pressStart2p(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'public/assets/images/pokemon_bg.png',
                scale: .5,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            NeoPopTiltedButton(
              isFloating: true,
              onTapUp: () {
                Get.toNamed(Routes.LIST_POKEMON);
              },
              decoration: const NeoPopTiltedButtonDecoration(
                color: Color.fromRGBO(255, 235, 52, 1),
                plunkColor: Color.fromRGBO(255, 235, 52, 1),
                shadowColor: Color.fromRGBO(36, 36, 36, 1),
                showShimmer: true,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70.0,
                  vertical: 15,
                ),
                child: Text(
                  'Find a pokemon',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
