import 'package:flutter/material.dart';
import 'package:flutter_web/utils/responsive.dart';

import '../utils/theme_data.dart';

class ReadyToSell extends StatelessWidget {
  const ReadyToSell({super.key, required this.screen});
  final Screens screen;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xffD6BCFA)),
        borderRadius: const BorderRadius.all(Radius.circular(60)),
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/background.png",
          ),
          fit: BoxFit.cover,
        ),
      ),

      ///https://www.figma.com/file/c0yNc7408AWBqGNBsG5wgf/Assignment-3?type=design&node- id=0%3A1&mode=design&t=VTT6ul4AKbXbIyjN-1
      child: Row(
        children: [
          if (screen != Screens.small)
            Image.asset('assets/images/trangle_diamond.png'),
          Container(
            padding: screen == Screens.small
                ? const EdgeInsets.symmetric(vertical: 24)
                : EdgeInsets.zero,
            width: screen == Screens.medium
                ? 350
                : screen == Screens.large
                    ? 580
                    : MediaQuery.of(context).size.width * .86,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  screen == Screens.small
                      ? 'Ready to sell ${screen == Screens.small ? "\n" : ""}your NFTs?'
                      : 'Ready to sell your${screen == Screens.small ? "\n" : ""} NFTs?',
                  style: lightThemeData.primaryTextTheme.displaySmall!.copyWith(
                      fontSize: screen == Screens.large ? 48 : 36,
                      fontWeight: screen == Screens.small
                          ? FontWeight.w600
                          : FontWeight.w700,
                      color: const Color(0xff000000)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    'Risus commodo id odio turpis pharetra elementum. Pulvinar porta porta feugiat scelerisque in elit. Morbi rhoncus, tellus, eros consequat magna semper orci a tincidunt. ',
                    style: ResponsiveWidget.bodyMedium(context)!.copyWith(
                      fontSize: screen == Screens.large ? 16 : 12,
                      color: Color(0xff532C59),
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                    'Sell right now',
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.1,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          if (screen != Screens.small)
            Image.asset('assets/images/circle_spring.png'),
        ],
      ),
    );
  }
}
