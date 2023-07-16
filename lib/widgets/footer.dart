import 'package:flutter/material.dart';
import 'package:flutter_web/utils/responsive.dart';

class FooterWidget extends StatelessWidget {
  FooterWidget({super.key, required this.screen});
  final Screens screen;
  final List<String> preTitles = [
    'Terms & Conditions',
    'Privacy Policy',
  ];

  final List<String> postTitles = [
    'Cookies',
    'Refunds',
    'License',
  ];

  final List<String> smallTitles = [
    'About us',
    'Team',
    'careers',
    'Socials',
    'Activity',
    'License',
    'Refunds',
    'Cookies',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        screen == Screens.large
            ? largeScreenFooter()
            : screen == Screens.medium
                ? midiumScreenFooter()
                : smallScreenFooter(context),
        const Padding(
          padding: EdgeInsets.all(32),
          child: Divider(color: Color(0xffCCD5DF), height: 2),
        ),
        decoratedText('Copyright 2022 Zeus UI'),
      ],
    );
  }

  Widget largeScreenFooter() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...preTitles
              .map((e) => Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(e),
                  ))
              .toList(),
          Expanded(child: Image.asset('assets/logos/zeusui.png')),
          ...postTitles
              .map((e) => Padding(
                    padding: const EdgeInsets.all(24),
                    child: decoratedText(e),
                  ))
              .toList(),
        ],
      );

  Widget midiumScreenFooter() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/logos/zeusui.png'),
          ...preTitles
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(e),
                  ))
              .toList(),
          ...postTitles
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: decoratedText(e),
                  ))
              .toList(),
        ],
      );

  Widget smallScreenFooter(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/logos/zeusui.png'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(color: Color(0xffCCD5DF), height: 2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: decoratedText(smallTitles[i]),
                  ),
              ]),
              Column(children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: decoratedText(smallTitles[i]),
                  ),
              ])
            ],
          )
        ],
      );

  Text decoratedText(String e) => Text(e,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black.withOpacity(.5),
      ));
}
