import 'package:flutter/material.dart';
import 'package:flutter_web/utils/responsive.dart';
import 'package:flutter_web/widgets/ready_to_sell.dart';

class TestimonialPage extends StatefulWidget {
  const TestimonialPage({super.key, required this.screens});
  final Screens screens;
  @override
  State<TestimonialPage> createState() => _TestimonialPageState();
}

class _TestimonialPageState extends State<TestimonialPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: widget.screens == Screens.small ? 1 : 3,
      childAspectRatio: widget.screens == Screens.small
          ? 2.3
          : widget.screens == Screens.large
              ? 2.5
              : 1.84, //10 / 4.6,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(
        9,
        (index) {
          return const TestimonialWidget();
        },
      ),
    );
  }
}

class TestimonialWidget extends StatelessWidget {
  const TestimonialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF532C59),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: const LinearGradient(
          colors: [Colors.white, Colors.transparent],
          stops: [.5, .5],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // primary: false,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Image.asset('assets/images/guy.png'),
              ),
              const Column(
                children: [Text('Brooklyn Simmons'), Text('@brooklynsimmons')],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: Text(
              'Sit ut diam bibendum dolor. Ullamcorper pharetra nibh eget vitae pulvinar. Placerat sapien, dolor, aenean vivamus in tincidunt et. Mauris dolor vestibulum et lacus a ante orci.',
              style: ResponsiveWidget.bodyMedium(context)!
                  .copyWith(fontSize: 10, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
