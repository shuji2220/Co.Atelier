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
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Ink(
            width: deviceWidth * 127 / 128,
            height: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("lib/assets/images/Home6.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcATop),
            )),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ModelContents(),
                  ),
                );
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
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Ink(
            width: deviceWidth * 127 / 128,
            height: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("lib/assets/images/Home1.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcATop),
            )),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhotoContents(),
                  ),
                );
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
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Ink(
            width: deviceWidth * 127 / 128,
            height: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("lib/assets/images/Home2.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcATop),
            )),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhotoPartyContents(),
                  ),
                );
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
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Ink(
            width: deviceWidth * 127 / 128,
            height: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("lib/assets/images/Home3.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcATop),
            )),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MovieContents(),
                  ),
                );
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
      ],
    );
  }
}
