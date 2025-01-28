import "package:flutter/material.dart";
import "package:modelhp/Screens/modelcontents.dart";
import "package:modelhp/Screens/moviecontents.dart";
import "package:modelhp/Screens/photocontents.dart";
import "package:modelhp/Screens/photopartycontents.dart";

class ConstructorContent extends StatefulWidget {
  const ConstructorContent({super.key});

  @override
  State<ConstructorContent> createState() {
    return _ConstructorContentState();
  }
}

class _ConstructorContentState extends State<ConstructorContent> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Ink(
              width: deviceWidth * 127 / 128,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("lib/assets/images/m.jpg"),
                fit: BoxFit.cover,
              )),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const ModelContents(),
                          transitionDuration: Duration.zero));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "モデル事業",
                    style: TextStyle(
                        fontSize: deviceWidth > 800 ? 40 : 25,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xFFffffff),
                        color: const Color(0xFFffffff)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Ink(
              width: deviceWidth * 127 / 128,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("lib/assets/images/p.jpg"),
                fit: BoxFit.cover,
              )),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const PhotoContents(),
                          transitionDuration: Duration.zero));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "フォト事業",
                    style: TextStyle(
                        fontSize: deviceWidth > 800 ? 40 : 25,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xFFffffff),
                        color: const Color(0xFFffffff)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Ink(
              width: deviceWidth * 127 / 128,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("lib/assets/images/s.jpg"),
                fit: BoxFit.cover,
              )),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const PhotoPartyContents(),
                          transitionDuration: Duration.zero));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "撮影会企画運営事業",
                    style: TextStyle(
                        fontSize: deviceWidth > 800 ? 40 : 25,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xFFffffff),
                        color: const Color(0xFFffffff)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Ink(
              width: deviceWidth * 127 / 128,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("lib/assets/images/e.jpg"),
                fit: BoxFit.cover,
              )),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const MovieContents(),
                          transitionDuration: Duration.zero));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "映像事業",
                    style: TextStyle(
                        fontSize: deviceWidth > 800 ? 40 : 25,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xFFffffff),
                        color: const Color(0xFFffffff)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
