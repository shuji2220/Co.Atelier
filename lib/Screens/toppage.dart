import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import "package:modelhp/components/constructorcontents.dart";
import 'package:modelhp/components/cardcousourle.dart';
import 'package:modelhp/components/visionimage.dart';
import 'package:modelhp/components/header_forhomepage.dart';
import 'package:modelhp/components/modelfirmcontent.dart';
import 'package:modelhp/components/footerforhomepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: HeaderforHomepage(onToggleDrawer: _toggleDrawer),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: context.scrollController,
              child: Column(
                children: [
                  const Cardcousourle(),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 26),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "01/",
                                style: TextStyle(
                                  fontSize: deviceWidth > 615 ? 64 : 40,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFFffffff),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "理念",
                                    style: TextStyle(
                                      fontSize: deviceWidth > 615 ? 12 : 8,
                                      color: const Color(0xFFffffff),
                                    ),
                                  ),
                                  Text(
                                    "Vision",
                                    style: TextStyle(
                                      fontSize: deviceWidth > 615 ? 28 : 18,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFffffff),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: deviceWidth > 650 ? 40 : 0,
                  ),
                  const VisionImage(),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 26),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "02/",
                              style: TextStyle(
                                fontSize: deviceWidth > 615 ? 64 : 40,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFFffffff),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "事業概要",
                                  style: TextStyle(
                                    fontSize: deviceWidth > 615 ? 12 : 8,
                                    color: const Color(0xFFffffff),
                                  ),
                                ),
                                Text(
                                  "Buisiness",
                                  style: TextStyle(
                                    fontSize: deviceWidth > 615 ? 28 : 18,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFffffff),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const ConstructorContent(),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 26),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "03/",
                                style: TextStyle(
                                  fontSize: deviceWidth > 615 ? 64 : 40,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFFffffff),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "事務所概要",
                                    style: TextStyle(
                                      fontSize: deviceWidth > 615 ? 12 : 8,
                                      color: const Color(0xFFffffff),
                                    ),
                                  ),
                                  Text(
                                    "Model Firm",
                                    style: TextStyle(
                                      fontSize: deviceWidth > 615 ? 28 : 18,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFffffff),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  const ModelFirmContent(),
                  const SizedBox(
                    height: 60,
                  ),
                  const FooterforHomepage(),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              right: _isDrawerOpen ? 0 : -deviceWidth,
              top: 0,
              bottom: 0,
              child: Container(
                width: deviceWidth > 650 ? deviceWidth * 0.3 : deviceWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    AppBar(
                      title: const Text(
                        'SiteMap',
                        style: TextStyle(color: Colors.white),
                      ),
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.black,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('SiteMapを表示'),
                    ),
                    // Add more content for the drawer here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
