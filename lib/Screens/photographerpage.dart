import 'package:flutter/material.dart';
import 'package:modelhp/Screens/photographerdetail.dart';
import 'package:modelhp/components/animatedpositioned.dart';
import 'package:modelhp/components/header_excepthome.dart';
import 'package:modelhp/Data/list_items_photographer.dart';
import 'package:modelhp/components/footerforhomepage.dart';

class PhotographerPage extends StatefulWidget {
  const PhotographerPage({super.key});
  @override
  _PhotographerPageState createState() => _PhotographerPageState();
}

class _PhotographerPageState extends State<PhotographerPage> {
  bool _isHovered = false;
  // bool _isRightDrawerOpen = false;
  bool _isLeftDrawerOpen = false;

  @override
  void initState() {
    super.initState();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  // void _toggleRightDrawer() {
  //   setState(() {
  //     _isRightDrawerOpen = !_isRightDrawerOpen;
  //   });
  // }

  void _toggleLeftDrawer() {
    setState(() {
      _isLeftDrawerOpen = !_isLeftDrawerOpen;
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
          child: HeaderforExceptHomepage(onToggleDrawer: _toggleLeftDrawer),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 10, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TextButton(
                      //   onPressed: _toggleRightDrawer,
                      //   style: TextButton.styleFrom(
                      //     side: const BorderSide(
                      //         color: Colors.white, width: 1), // Outline border
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 8, vertical: 8),
                      //   ),
                      //   child: const Text(
                      //     '<検索条件を指定する>',
                      //     style: TextStyle(fontSize: 16, color: Colors.white),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Photographer List',
                        style: TextStyle(
                            fontSize: deviceWidth > 800 ? 45 : 32,
                            color: const Color(0xFFe6e6e6)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: listitems_photographer.map((photographer) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, top: 40, right: 40, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    photographer['name'],
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFFe6e6e6),
                                    ),
                                  ),
                                  Text(
                                    photographer['furigana'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFe6e6e6),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  deviceWidth > 800
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  '【活動エリア】',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Color(0xFFe6e6e6),
                                                  ),
                                                ),
                                                ...photographer['活動エリア']
                                                    .map((area) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    child: Text(
                                                      area,
                                                      style: const TextStyle(
                                                        fontSize: 25,
                                                        color:
                                                            Color(0xFFe6e6e6),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ],
                                            ),
                                            MouseRegion(
                                              onEnter: (event) =>
                                                  _onHover(true),
                                              onExit: (event) =>
                                                  _onHover(false),
                                              child: AnimatedOpacity(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                opacity: _isHovered ? 0.5 : 1.0,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PhotographerDetail(
                                                          photographer:
                                                              photographer,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: const Text(
                                                    'View All',
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      color: Color(0xFFe6e6e6),
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor:
                                                          Color(0xFFe6e6e6),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  '【活動エリア】',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFFe6e6e6),
                                                  ),
                                                ),
                                                ...photographer['活動エリア']
                                                    .map((area) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    child: Text(
                                                      area,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFFe6e6e6),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            MouseRegion(
                                              onEnter: (event) =>
                                                  _onHover(true),
                                              onExit: (event) =>
                                                  _onHover(false),
                                              child: AnimatedOpacity(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                opacity: _isHovered ? 0.5 : 1.0,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PhotographerDetail(
                                                          photographer:
                                                              photographer,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: const Text(
                                                    'View All',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFFe6e6e6),
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor:
                                                          Color(0xFFe6e6e6),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        photographer['photos'].length,
                                        (index) {
                                          return Image.asset(
                                            photographer['photos'][index],
                                            width: 375,
                                            height: 275,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const FooterforHomepage(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //LeftとRight逆です
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 300),
            //   left: _isRightDrawerOpen ? 0 : -deviceWidth,
            //   top: 0,
            //   bottom: 0,
            //   child: Container(
            //     width: deviceWidth > 800 ? deviceWidth * 0.3 : deviceWidth,
            //     color: Colors.white,
            //     child: Column(
            //       children: [
            //         AppBar(
            //           title: const Text(
            //             '検索条件を指定する',
            //             style: TextStyle(color: Colors.white),
            //           ),
            //           automaticallyImplyLeading: false,
            //           backgroundColor: Colors.black,
            //           actions: [
            //             IconButton(
            //               icon: const Icon(Icons.close),
            //               onPressed: _toggleRightDrawer,
            //             ),
            //           ],
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.all(16.0),
            //           child: Text('ここに検索条件の内容を入力します。'),
            //         ),
            //         // Add more content for the drawer here
            //       ],
            //     ),
            //   ),
            // ),
            CustomAnimatedPositioned(
                isDrawerOpen: _isLeftDrawerOpen, deviceWidth: deviceWidth)
          ],
        ),
      ),
    );
  }
}
