import 'package:flutter/material.dart';

import '../model/page_model.dart';
import '../service/services.dart';
import '../utils/responsive.dart';

class ProvidePage extends StatefulWidget {
  const ProvidePage({super.key, required this.screen});
  final Screens screen;
  @override
  State<ProvidePage> createState() => _ProvidePageState();
}

class _ProvidePageState extends State<ProvidePage> {
  List<Collections>? provids;

  @override
  void initState() {
    _displayData();
    super.initState();
  }

  void _displayData() async {
    await Services().loadProvidesData().then((value) {
      setState(() => provids = value.provids ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...provids!
            .map((e) => ProvideWidget(
                  collections: e,
                  screen: widget.screen,
                ))
            .toList()
      ],
    );
  }
}

class ProvideWidget extends StatelessWidget {
  const ProvideWidget(
      {super.key, required this.collections, required this.screen});
  final Screens screen;
  final Collections collections;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(collections.image!),
          const SizedBox(height: 12),
          Text(
            collections.title!,
            style: ResponsiveWidget.labelMedium(context),
          ),
          const SizedBox(height: 12),
          Container(
            width: 246,
            margin: EdgeInsets.symmetric(
                horizontal: screen == Screens.large ? 32 : 24),
            child: Text(
              collections.subTitle!,
              style: ResponsiveWidget.textSmall(context),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
