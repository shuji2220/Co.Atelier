import 'package:flutter/material.dart';
import 'package:modelhp/Screens/modelpage.dart';
import 'package:modelhp/Screens/moviecontents.dart';
import 'package:modelhp/Screens/offerpage.dart';
import 'package:modelhp/Screens/photopartycontents.dart';
import 'package:modelhp/Screens/toppage.dart';
import 'package:modelhp/Screens/photographerpage.dart';
import "package:modelhp/Screens/modelcontents.dart";
import "package:modelhp/Screens/photocontents.dart";
import 'package:modelhp/components/pdfview.dart';

class CustomAnimatedPositioned extends StatefulWidget {
  final bool isDrawerOpen;
  final double deviceWidth;

  const CustomAnimatedPositioned(
      {super.key, required this.isDrawerOpen, required this.deviceWidth});

  @override
  _CustomAnimatedPositionedState createState() =>
      _CustomAnimatedPositionedState();
}

class _CustomAnimatedPositionedState extends State<CustomAnimatedPositioned> {
  void _openPDFkiyaku() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PDFViewerPage(
            pdfPath: 'lib/assets/card.pdf'), // Replace with your PDF file path
      ),
    );
  }

  void _openPDFprivacy() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PDFViewerPage(
            pdfPath: 'lib/assets/card.pdf'), // Replace with your PDF file path
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      right: widget.isDrawerOpen ? 0 : -widget.deviceWidth,
      top: 0,
      bottom: 0,
      child: Container(
        width: widget.deviceWidth > 650 ? 300 : widget.deviceWidth,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: const Text(
                'SiteMap',
                style: TextStyle(color: Colors.white),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Site Map',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ),
                          );
                        },
                        child: const Text('Top'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ModelContents(),
                            ),
                          );
                        },
                        child: const Text('モデル事業'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhotoContents(),
                            ),
                          );
                        },
                        child: const Text('フォト事業'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhotoPartyContents(),
                            ),
                          );
                        },
                        child: const Text('撮影会企画運営事業'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MovieContents(),
                            ),
                          );
                        },
                        child: const Text('映像事業'),
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
                        child: const Text('Model list'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhotographerPage(),
                            ),
                          );
                        },
                        child: const Text('Photograpaher list'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OfferPage(),
                            ),
                          );
                        },
                        child: const Text('案件依頼'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    '各種規約',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: _openPDFkiyaku,
                        child: const Text('モデル事務所規約'),
                      ),
                      TextButton(
                        onPressed: _openPDFprivacy,
                        child: const Text('Privacy Policy'),
                      ),
                    ],
                  ),
                ),
              ],
            )
            // Add more content for the drawer here
          ],
        ),
      ),
    );
  }
}
