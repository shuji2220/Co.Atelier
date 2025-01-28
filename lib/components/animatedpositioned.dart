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
import 'package:bordered_text/bordered_text.dart';

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
            pdfPath:
                'lib/assets/モデル事務所規約.pdf'), // Replace with your PDF file path
      ),
    );
  }

  void _openPDFprivacy() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PDFViewerPage(
            pdfPath:
                'lib/assets/PrivacyPolicy.pdf'), // Replace with your PDF file path
      ),
    );
  }

  void _openPDFrights() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PDFViewerPage(
            pdfPath: 'lib/assets/著作権関係.pdf'), // Replace with your PDF file path
      ),
    );
  }

  void _openPDFsecret() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PDFViewerPage(
            pdfPath:
                'lib/assets/秘密保持契約書.pdf'), // Replace with your PDF file path
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      right: widget.isDrawerOpen ? 0 : -widget.deviceWidth,
      top: 0,
      bottom: 0,
      child: SingleChildScrollView(
        child: Container(
          width: widget.deviceWidth > 650 ? 300 : widget.deviceWidth,
          height: deviceHeight > 600 ? deviceHeight : 800,
          color: const Color.fromARGB(255, 0, 28, 65).withOpacity(0.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: BorderedText(
                      strokeWidth: 4.0,
                      strokeColor: Colors.white,
                      child: const Text(
                        'Site Map',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
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
                          child: const Text(
                            'Top',
                            style: TextStyle(color: Colors.white),
                          ),
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
                          child: const Text('モデル事業',
                              style: TextStyle(color: Colors.white)),
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
                          child: const Text('フォト事業',
                              style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PhotoPartyContents(),
                              ),
                            );
                          },
                          child: const Text('撮影会企画運営事業',
                              style: TextStyle(color: Colors.white)),
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
                          child: const Text('映像事業',
                              style: TextStyle(color: Colors.white)),
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
                          child: const Text('Model list',
                              style: TextStyle(color: Colors.white)),
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
                          child: const Text('Photograpaher list',
                              style: TextStyle(color: Colors.white)),
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
                          child: const Text('案件依頼',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: BorderedText(
                      strokeWidth: 4.0,
                      strokeColor: Colors.white,
                      child: const Text(
                        '各種規約',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: _openPDFkiyaku,
                          child: const Text('事務所規約',
                              style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: _openPDFprivacy,
                          child: const Text('Privacy Policy',
                              style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: _openPDFrights,
                          child: const Text('ウェブサイトの著作権誓約書',
                              style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: _openPDFsecret,
                          child: const Text('お客様との秘密保持契約書雛形',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Add more content for the drawer here
            ],
          ),
        ),
      ),
    );
  }
}
