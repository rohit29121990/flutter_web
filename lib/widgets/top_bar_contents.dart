// import 'package:flutter_web/screens/home_page.dart';
// import 'package:flutter_web/utils/authentication.dart';
// import 'package:flutter_web/widgets/auth_dialog.dart';
import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity, {super.key});

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  // final List _isHovering = [
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false
  // ];

  final bool _isProcessing = false;
  List<String> menus = [
    'Home',
    'University',
    'Courses',
    'Use cases',
    'Plans',
    'Resources'
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i <= 2; i++)
                    InkWell(
                      onHover: (value) {
                        // setState(() {
                        //   value
                        //       ? _isHovering[0] = true
                        //       : _isHovering[0] = false;
                        // });
                      },
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 18),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              menus[i],
                              style: TextStyle(
                                fontSize: 16,
                                height: .20,
                                fontWeight: FontWeight.w500,
                                color:
                                    //  _isHovering[0]
                                    //     ? Colors.black
                                    //     :
                                    Colors.black.withOpacity(.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              Image.asset('assets/logos/logo.png'),
              Row(
                children: [
                  for (int i = 3; i < menus.length; i++)
                    InkWell(
                      onHover: (value) {
                        // setState(() {
                        //   value
                        //       ? _isHovering[0] = true
                        //       : _

                        //       isHovering[0] = false;
                        // });
                      },
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 18),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  menus[i],
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: .20,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        // _isHovering[i]
                                        //     ? Colors.black
                                        //     :
                                        Colors.black.withOpacity(.5),
                                  ),
                                ),
                                if (i == 4)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 6),
                                    child: Icon(
                                      Icons.expand_more,
                                      color:
                                          //  _isHovering[i]
                                          //     ? Colors.black
                                          //     :
                                          Colors.black.withOpacity(.5),
                                    ),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
