import 'package:flutter/material.dart';
import 'package:flutter_web/model/team_model.dart';
import 'package:flutter_web/utils/responsive.dart';

import '../utils/theme_data.dart';

class TeamMamber extends StatelessWidget {
  const TeamMamber({super.key, required this.team});
  final Team team;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 194,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(team.image!),
          ),
          Text(
            team.name!,
            style: ResponsiveWidget.labelLarge(context),
          ),
          Text(
            team.post!,
            style: const TextStyle(
                color: Color(0xff532C59),
                fontWeight: FontWeight.w300,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}
