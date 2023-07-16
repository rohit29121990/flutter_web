import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/model/page_model.dart';
import 'package:flutter_web/model/team_model.dart';
import 'package:flutter_web/service/services.dart';
import 'package:flutter_web/widgets/faq_page.dart';
import 'package:flutter_web/widgets/footer.dart';
import 'package:flutter_web/widgets/hottest_collections.dart';
import 'package:flutter_web/widgets/ready_to_sell.dart';
import 'package:flutter_web/widgets/team_mamber.dart';
import 'package:flutter_web/widgets/testimonial.dart';

import 'widgets/create_to_sell.dart';
import 'widgets/explore_drawer.dart';
import 'widgets/provides.dart';
import 'utils/responsive.dart';
import 'widgets/top_bar_contents.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  late Screens screen;
  List<Collections> collections = [];
  List<Team> team = [];

  List<String> logos = [
    'assets/logos/ipsum.png',
    'assets/logos/ipsum1.png',
    'assets/logos/ipsum2.png',
    'assets/logos/zeusui.png',
    'assets/logos/ipsum3.png',
    'assets/logos/ipsum4.png',
  ];
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _displayData();
    super.initState();
  }

  void _displayData() async {
    await Services().loadData().then((value) {
      setState(() => collections = value.collections ?? []);
    });

    await Services().loadTeamData().then((value) {
      setState(() => team = value.team ?? []);
    });
  }

  @override
  void didChangeDependencies() {
    TextStyle? screens = ResponsiveWidget.titleLarge(context);
    screen = ResponsiveWidget.screenSize(context);
    print('returned is:${screen}');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      backgroundColor:
          const Color(0xffFCFAFF), //Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isLargeScreen(context)
          ? PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            )
          : AppBar(
              backgroundColor: Colors.white,
              // Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              title: Image.asset('assets/logos/logo.png'),
              centerTitle: true,
              actions: const [],
            ),
      drawer: const ExploreDrawer(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(getUniversalPadding()),
          width: getScreenSize(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CreateToSell(screen: screen),
                const SizedBox(height: 72),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen == Screens.small ? 10 : 180),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ...logos
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              child: Image.asset(
                                e,
                                scale: screen == Screens.large ? 1.2 : 1.8,
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                Text(
                  'Hottest Collections',
                  style: ResponsiveWidget.titleMedium(context),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen == Screens.medium ? 32 : 16,
                      vertical: screen == Screens.small ? 8 : 16),
                  width: 780,
                  child: Text(
                    'Risus commodo id odio turpis pharetra elementum. Pulvinar porta porta feugiat scelerisque in elit. Morbi rhoncus, tellus, eros consequat magna semper',
                    style: ResponsiveWidget.bodyMedium(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: screen == Screens.small ? 1 : 3,
                    childAspectRatio: getChildAspectRatio(),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      collections.length,
                      (index) {
                        return HottestCollections(
                          data: collections[index],
                          width: getCollectionWidth(),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: screen == Screens.large ? 153 : 100,
                ),
                Text(
                  'Our Team',
                  style: ResponsiveWidget.titleMedium(context),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen == Screens.medium ? 32 : 16,
                      vertical: screen == Screens.small ? 8 : 16),
                  width: 780,
                  child: Text(
                    'Risus commodo id odio turpis pharetra elementum. Pulvinar porta porta feugiat scelerisque in elit. Morbi rhoncus, tellus, eros consequat magna semper orci a tincidunt.',
                    style: ResponsiveWidget.bodyMedium(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: screen == Screens.large
                      ? 80
                      : screen == Screens.medium
                          ? 65
                          : 48,
                ),
                Wrap(
                  children: [...team.map((e) => TeamMamber(team: e)).toList()],
                ),
                SizedBox(
                  height: screen == Screens.large
                      ? 153
                      : screen == Screens.medium
                          ? 160
                          : 96,
                ),
                Text(
                  'We Provide',
                  style: ResponsiveWidget.titleMedium(context),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen == Screens.medium ? 160 : 16,
                      vertical: screen == Screens.small ? 8 : 16),
                  width: 780,
                  child: Text(
                    'Risus commodo id odio turpis pharetra elementum. Pulvinar porta porta feugiat scelerisque in elit. Morbi rhoncus, tellus, eros consequat magna semper orci a tincidunt.',
                    style: ResponsiveWidget.bodyMedium(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: screen == Screens.large
                      ? 80
                      : screen == Screens.medium
                          ? 64
                          : 32,
                ),
                ProvidePage(screen: screen),
                SizedBox(
                  height: screen == Screens.large
                      ? 200
                      : screen == Screens.medium
                          ? 128
                          : 96,
                ),
                Text(
                  'Testimonials',
                  style: ResponsiveWidget.titleMedium(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screen == Screens.large
                      ? 80
                      : screen == Screens.medium
                          ? 64
                          : 32,
                ),
                TestimonialPage(screens: screen),
                FAQPage(screens: screen),
                ReadyToSell(screen: screen),
                FooterWidget(screen: screen),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double getCollectionWidth() {
    return screen == Screens.large
        ? 412
        : screen == Screens.medium
            ? 240
            : 288;
  }

  getChildAspectRatio() {
    return screen == Screens.large
        ? getCollectionWidth() / 440
        : screen == Screens.medium
            ? getCollectionWidth() / 360
            : getCollectionWidth() / 350;
  }

  double getUniversalPadding() {
    if (screen == Screens.large) {
      return 70;
    } else if (screen == Screens.medium) {
      return 32;
    } else {
      return 10;
    }
  }

  double getScreenSize(BuildContext context) {
    return screen == Screens.large
        ? 1360
        : screen == Screens.medium
            ? 1080
            : MediaQuery.of(context).size.width;
  }
}
