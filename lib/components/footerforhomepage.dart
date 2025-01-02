import "package:flutter/material.dart";
import 'package:modelhp/Screens/modelpage.dart';
import 'package:modelhp/Screens/offerpage.dart';
import 'package:modelhp/Screens/toppage.dart';
import 'package:modelhp/Screens/photographerpage.dart';

class FooterforHomepage extends StatefulWidget {
  const FooterforHomepage({super.key});

  @override
  State<FooterforHomepage> createState() {
    return _FooterforHomepageState();
  }
}

class _FooterforHomepageState extends State<FooterforHomepage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: Color(0xFF000000), width: 2.0),
        ),
        color: const Color(0xFFE3E3E3).withOpacity(0.8),
      ),
      width: deviceWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (deviceWidth > 650)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "SiteMap",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ),
                      );
                    },
                    child: const Text('Top')),
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text('Business Contents',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              TextButton(onPressed: () {}, child: const Text('モデル事業')),
              TextButton(onPressed: () {}, child: const Text('フォト事業')),
              TextButton(onPressed: () {}, child: const Text('撮影会企画運営事業')),
              TextButton(onPressed: () {}, child: const Text('映像事業')),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text('Contents',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Modelpage(),
                      ),
                    );
                  },
                  child: const Text('Model List')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhotographerPage(),
                      ),
                    );
                  },
                  child: const Text('Photographer List')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OfferPage(),
                      ),
                    );
                  },
                  child: const Text('案件依頼')),
            ],
          ),
        ],
      ),
    );
  }
}
