import 'package:flutter/material.dart';
import "package:modelhp/components/constructorcontents.dart";
import 'package:modelhp/components/cardcousourle.dart';
import 'package:modelhp/components/visionimage.dart';
import 'package:modelhp/components/header_forhomepage.dart';
import 'package:modelhp/components/modelfirmcontent.dart';
import 'package:modelhp/components/footerforhomepage.dart';
import 'package:modelhp/components/animatedpositioned.dart';

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: HeaderforHomepage(onToggleDrawer: _toggleDrawer),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.black,
                  expandedHeight: deviceWidth > deviceHeight
                      ? deviceHeight * 7 / 8
                      : deviceHeight / 2,
                  flexibleSpace: const FlexibleSpaceBar(
                    background: Cardcousourle(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: deviceWidth > 650 ? 40 : 10,
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
                                    fontSize: deviceWidth > 800 ? 64 : 40,
                                    fontWeight: FontWeight.w900,
                                    color: const Color(0xFFffffff),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "理念",
                                      style: TextStyle(
                                        fontSize: deviceWidth > 800 ? 12 : 8,
                                        color: const Color(0xFFffffff),
                                      ),
                                    ),
                                    Text(
                                      "Vision",
                                      style: TextStyle(
                                        fontSize: deviceWidth > 800 ? 28 : 18,
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
                      height: deviceWidth > 650 ? 40 : 10,
                    ),
                    const VisionImage(),
                    SizedBox(
                      height: deviceWidth > 650 ? 40 : 10,
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
                                  fontSize: deviceWidth > 800 ? 64 : 40,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFFffffff),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "事業概要",
                                    style: TextStyle(
                                      fontSize: deviceWidth > 800 ? 12 : 8,
                                      color: const Color(0xFFffffff),
                                    ),
                                  ),
                                  Text(
                                    "Buisiness",
                                    style: TextStyle(
                                      fontSize: deviceWidth > 800 ? 28 : 18,
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
                                    fontSize: deviceWidth > 800 ? 64 : 40,
                                    fontWeight: FontWeight.w900,
                                    color: const Color(0xFFffffff),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "事務所概要",
                                      style: TextStyle(
                                        fontSize: deviceWidth > 800 ? 12 : 8,
                                        color: const Color(0xFFffffff),
                                      ),
                                    ),
                                    Text(
                                      "Model Firm",
                                      style: TextStyle(
                                        fontSize: deviceWidth > 800 ? 28 : 18,
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
                  ]),
                )
              ],
            ),
            CustomAnimatedPositioned(
                isDrawerOpen: _isDrawerOpen, deviceWidth: deviceWidth)
          ],
        ),
      ),
    );
  }
}
