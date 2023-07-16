import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class CreateToSell extends StatelessWidget {
  const CreateToSell({super.key, required this.screen});
  final Screens screen;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            left: screen == Screens.small ? -38 : 10,
            top: screen == Screens.small ? 180 : 80,
            child: Image.asset(
              'assets/images/circle.png',
              scale: 2,
            )),
        Positioned(
            right: screen == Screens.large ? 100 : 0,
            top: 80,
            child: Image.asset(
              'assets/images/traingle.png',
              scale: 2,
            )),
        Positioned(
            left: 0,
            bottom: screen == Screens.small ? -10 : 0,
            child: Image.asset(
              'assets/images/spring.png',
              scale: 2,
            )),
        Positioned(
            right: screen == Screens.large ? 0 : -40,
            bottom: 0,
            child: Image.asset(
              'assets/images/diamond.png',
              scale: 2,
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 60),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.cover,
            ),
          ),

          ///https://www.figma.com/file/c0yNc7408AWBqGNBsG5wgf/Assignment-3?type=design&node- id=0%3A1&mode=design&t=VTT6ul4AKbXbIyjN-1
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 80),
              Text(
                'Create & sell\nyour NFTs${screen == Screens.small ? "\n" : ""} today',
                style: ResponsiveWidget.titleLarge(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const Text(
                'Velit, odio bibendum eu, viverra sit laoreet posuere. Ut scelerisque posuere massa amet. Ornare\nlacinia vitae at vestibulum morbi. Volutpat libero curabitur feugiat risus dui pulvinar. Elementum.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff532C59),
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff532C59),
                ),
                child: const Text(
                  'Let\'s Sell',
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.1,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
