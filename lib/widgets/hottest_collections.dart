import 'package:flutter/material.dart';
import 'package:flutter_web/utils/responsive.dart';

import '../model/page_model.dart';

class HottestCollections extends StatelessWidget {
  const HottestCollections(
      {super.key, required this.width, required this.data});
  final double width;
  final Collections data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Expanded(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: 300,
              width: width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage(
                    data.image!,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                data.title!,
                style: ResponsiveWidget.titleSmall(context),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Text(
                data.subTitle!,
                style: ResponsiveWidget.bodySmall(context),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
