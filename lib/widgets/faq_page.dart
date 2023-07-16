import 'package:flutter/material.dart';
import 'package:flutter_web/utils/responsive.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key, required this.screens});
  final Screens screens;
  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.vertical,
          // crossAxisAlignment: widget.screens == Screens.small
          //     ? CrossAxisAlignment.center
          //     : CrossAxisAlignment.start,
          children: [
            SizedBox(
              width:
                  getSubTitleWidth(widget.screens == Screens.small ? 0.84 : .9),
              child: Text(
                'Frequently Asked Questions',
                style: ResponsiveWidget.textMedium(context)!
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: widget.screens == Screens.small
                    ? TextAlign.center
                    : TextAlign.start,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: getSubTitleWidth(1.1),
              child: Text(
                'Risus commodo id odio turpis pharetra elementum. Pulvinar porta porta feugiat scelerisque in elit. Morbi rhoncus, tellus, eros consequat magna semper orci a tincidunt.',
                style: ResponsiveWidget.bodyMedium(context)!.copyWith(
                    fontWeight: widget.screens == Screens.small
                        ? FontWeight.w300
                        : FontWeight.w400),
                textAlign: widget.screens == Screens.small
                    ? TextAlign.center
                    : TextAlign.start,
              ),
            ),
            const SizedBox(height: 26),
            Visibility(visible: widget.screens == Screens.small, child: faqs()),
          ],
        ),
        Visibility(visible: widget.screens != Screens.small, child: faqs()),
      ],
    );
  }

  double getSubTitleWidth(double x) {
    if (widget.screens == Screens.large) {
      return 400 * x;
    } else if (widget.screens == Screens.medium) {
      return 360 * x;
    } else {
      return 240 * x;
    }
  }

  getChildAspectRatio() {
    return widget.screens == Screens.large
        ? getCollectionWidth() / 440
        : widget.screens == Screens.medium
            ? getCollectionWidth() / 360
            : getCollectionWidth() / 350;
  }

  double getCollectionWidth() {
    return widget.screens == Screens.large
        ? 412
        : widget.screens == Screens.medium
            ? 240
            : 288;
  }

  faqs() => SizedBox(
        height: 400,
        width: widget.screens == Screens.large ? 760 : 370,
        child: GridView.count(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          // padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.6,
          crossAxisCount: widget.screens == Screens.large ? 2 : 1,
          children: List.generate(
            80,
            (index) {
              return FAQWidget(screens: widget.screens);
            },
          ),
        ),
      );
}

class FAQWidget extends StatefulWidget {
  const FAQWidget({super.key, required this.screens});
  final Screens screens;

  @override
  State<FAQWidget> createState() => _FAQWidgetState();
}

class _FAQWidgetState extends State<FAQWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //     vertical: widget.screens == Screens.small ? 8 : 12,
      //     horizontal: widget.screens == Screens.large ? 32 : 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffD6BCFA),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          SizedBox(
              width: 260, //200,
              child: Text(
                'What kind of websites I can build with Zeus UI?',
                style: ResponsiveWidget.labelMedium(context)!.copyWith(
                    fontSize: widget.screens == Screens.small ? 16 : 20),
              )),
          const SizedBox(width: 32),
          const Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}
