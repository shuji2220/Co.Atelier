import 'package:flutter/material.dart';
import 'package:modelhp/components/animatedpositioned.dart';
import 'package:modelhp/components/header_excepthome.dart';
import 'package:modelhp/Data/list_items.dart';
import 'package:modelhp/Screens/modeldetailpage.dart';
import 'package:modelhp/components/footerforhomepage.dart';

class Modelpage extends StatefulWidget {
  const Modelpage({super.key});
  @override
  State<Modelpage> createState() => _ModelpageState();
}

class _ModelpageState extends State<Modelpage> {
  late List<bool> _isHovered;
  // bool _isRightDrawerOpen = false;
  bool _isLeftDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _isHovered = List<bool>.filled(listitems.length, false);
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
    // final deviceHeight = MediaQuery.of(context).size.height;
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
                    padding: EdgeInsets.only(
                        top: 25, bottom: deviceWidth > 800 ? 35 : 10, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TextButton(
                        //   onPressed: _toggleRightDrawer,
                        //   style: TextButton.styleFrom(
                        //     side: const BorderSide(
                        //         color: Colors.white,
                        //         width: 1), // Outline border
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
                          'Model List',
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
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: deviceWidth > 1000
                                            ? deviceWidth > 650
                                                ? 4
                                                : 2
                                            : 1),
                                itemCount: listitems.length,
                                itemBuilder: (context, index) {
                                  // ignore: prefer_interpolation_to_compose_strings
                                  return SizedBox(
                                    width: 300,
                                    height: 500,
                                    child: Column(
                                      children: [
                                        InkWell(
                                          key:
                                              ValueKey(listitems[index]['key']),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ModelDetailPage(
                                                  item: listitems[index],
                                                ),
                                              ),
                                            );
                                          },
                                          onHover: (value) {
                                            setState(() {
                                              _isHovered[index] = value;
                                            });
                                          },
                                          child: Container(
                                            width: 180,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    listitems[index]['photo1']),
                                                fit: BoxFit.cover,
                                                opacity:
                                                    _isHovered[index] ? 0.6 : 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          listitems[index]['text'],
                                          style: TextStyle(
                                              color: const Color(0xFFe6e6e6),
                                              fontSize:
                                                  deviceWidth > 800 ? 20 : 16),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const FooterforHomepage(),
                            ],
                          )
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
          )),
    );
  }
}
