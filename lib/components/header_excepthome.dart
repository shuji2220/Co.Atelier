import 'package:flutter/material.dart';
import 'package:modelhp/Screens/toppage.dart';
import 'package:modelhp/Screens/offerpage.dart';
import 'package:modelhp/Screens/photographerpage.dart';
import 'package:modelhp/Screens/modelpage.dart';

class HeaderforExceptHomepage extends StatefulWidget {
  final VoidCallback onToggleDrawer;
  const HeaderforExceptHomepage({super.key, required this.onToggleDrawer});
  @override
  State<HeaderforExceptHomepage> createState() =>
      _HeaderforExceptHomepageState();
}

class _HeaderforExceptHomepageState extends State<HeaderforExceptHomepage> {
  bool _isListIcon = false;

  void _toggleIcon() {
    setState(() {
      _isListIcon = !_isListIcon;
    });
    widget.onToggleDrawer();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return AppBar(
        automaticallyImplyLeading: false,
        shape: const Border(
            bottom: BorderSide(
          color: Color(0xFF000000),
          width: 2,
        )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 130,
              height: 50,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const Homepage(),
                            transitionDuration: Duration.zero));
                  },
                  icon: Image.asset("lib/assets/images/VisionImage.png")),
            ),
            if (deviceWidth > 800)
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const Homepage(),
                                transitionDuration: Duration.zero));
                      },
                      child: const Text("Top",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black))),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const Modelpage(),
                                transitionDuration: Duration.zero));
                      },
                      child: const Text("Model",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black))),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const PhotographerPage(),
                                transitionDuration: Duration.zero));
                      },
                      child: const Text("Photographer",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black))),
                ],
              ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE3E3E3).withOpacity(0.8)),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const OfferPage(),
                        transitionDuration: Duration.zero));
              },
              child: const Text(
                "案件依頼",
                style: TextStyle(
                    color: Color(0xFF6A6A6A),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 3),
            child: Container(
                padding: const EdgeInsets.all(0),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF6A6A6A), width: 2)),
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: _toggleIcon,
                    icon: Icon(
                      _isListIcon ? Icons.close : Icons.list_outlined,
                      color: const Color(0xFF6A6A6A),
                      size: 24,
                    ))),
          )
        ],
        backgroundColor: const Color(0xFFE3E3E3));
  }
}
