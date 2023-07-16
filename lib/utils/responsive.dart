import 'package:flutter/material.dart';
import 'package:flutter_web/utils/theme_data.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  static TextStyle? titleLarge(context) {
    Screens screen = screenSize(context);
    if (screen == Screens.large) {
      return lightThemeData.primaryTextTheme.displayLarge!.copyWith(
          height: 1.2, color: const Color(0xff000000), letterSpacing: 7);
    } else if (screen == Screens.medium) {
      return lightThemeData.primaryTextTheme.displayMedium!.copyWith(
          height: 1.2, color: const Color(0xff000000), letterSpacing: 7);
    } else {
      return lightThemeData.primaryTextTheme.titleLarge!.copyWith(
          height: 1.2, color: const Color(0xff000000), letterSpacing: 7);
    }
  }

  static TextStyle? titleMedium(context) {
    Screens screen = screenSize(context);
    late TextStyle style;
    if (screen == Screens.large) {
      style = lightThemeData.primaryTextTheme.displaySmall!;
    } else if (screen == Screens.medium) {
      style = lightThemeData.primaryTextTheme.headlineMedium!;
    } else {
      style = lightThemeData.primaryTextTheme.titleLarge!;
    }
    return style.copyWith(height: 1.2, color: const Color(0xff000000));
  }

  static TextStyle? titleSmall(context) {
    Screens screen = screenSize(context);
    if (screen == Screens.large) {
      return lightThemeData.primaryTextTheme.titleSmall!
          .copyWith(color: const Color(0xff000000));
    } else {
      return lightThemeData.primaryTextTheme.labelLarge!
          .copyWith(color: const Color(0xff000000));
    }
  }

  static TextStyle? bodyMedium(context) {
    Screens screen = screenSize(context);
    if (screen == Screens.small) {
      return lightThemeData.primaryTextTheme.labelSmall!
          .copyWith(color: const Color(0xff532C59), fontSize: 14);
    } else {
      return lightThemeData.primaryTextTheme.labelSmall!
          .copyWith(color: const Color(0xff532C59), fontSize: 16);
    }
  }

  static TextStyle? bodySmall(context) {
    Screens screen = screenSize(context);
    if (screen == Screens.large) {
      return lightThemeData.primaryTextTheme.labelSmall!
          .copyWith(color: const Color(0xff532C59), fontSize: 14);
    } else {
      return lightThemeData.primaryTextTheme.labelLarge!
          .copyWith(color: const Color(0xff532C59), fontSize: 12);
    }
  }

  static TextStyle? labelLarge(context) {
    Screens screen = screenSize(context);
    if (screen == Screens.small) {
      return lightThemeData.primaryTextTheme.labelMedium!
          .copyWith(color: const Color(0xff000000));
    } else {
      return lightThemeData.primaryTextTheme.bodyMedium!
          .copyWith(color: const Color(0xff000000));
    }
  }

  static TextStyle? labelMedium(context) {
    Screens screen = screenSize(context);
    if (screen == Screens.small) {
      return lightThemeData.primaryTextTheme.labelMedium!
          .copyWith(color: const Color(0xff000000));
    } else {
      return lightThemeData.primaryTextTheme.bodyLarge!
          .copyWith(color: const Color(0xff000000));
    }
  }

  static TextStyle? textMedium(context) {
    Screens screen = screenSize(context);
    late TextStyle style;
    if (screen == Screens.large) {
      style = lightThemeData.primaryTextTheme.displaySmall!;
    } else if (screen == Screens.medium) {
      style = lightThemeData.primaryTextTheme.headlineMedium!;
    } else {
      style = lightThemeData.primaryTextTheme.titleLarge!;
    }
    return style.copyWith(color: const Color(0xff000000));
  }

  static TextStyle? textSmall(context) {
    Screens screen = screenSize(context);
    if (screen == Screens.small) {
      return const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w300, color: Color(0xff532C59));
    } else {
      return const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff532C59));
    }
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  static Screens screenSize(BuildContext context) {
    if (isSmallScreen(context)) {
      return Screens.small;
    } else if (isMediumScreen(context)) {
      return Screens.medium;
    } else {
      return Screens.large;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

enum Screens { small, medium, large }
