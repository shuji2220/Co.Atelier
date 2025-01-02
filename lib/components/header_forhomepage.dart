import 'package:flutter/material.dart';
import 'package:modelhp/Screens/modelpage.dart';
import 'package:modelhp/Screens/toppage.dart';
import 'package:modelhp/Screens/offerpage.dart';
import 'package:modelhp/Screens/photographerpage.dart';

class HeaderforHomepage extends StatefulWidget {
  final VoidCallback onToggleDrawer;
  const HeaderforHomepage({super.key, required this.onToggleDrawer});
  @override
  State<HeaderforHomepage> createState() => _HeaderforHomepageState();
}

class _HeaderforHomepageState extends State<HeaderforHomepage> {
  bool _isListIcon = true;

  void _toggleIcon() {
    setState(() {
      _isListIcon = !_isListIcon;
    });
    widget.onToggleDrawer();
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
              width: 150,
              height: 50,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homepage(),
                      ),
                    );
                  },
                  icon: Image.asset("lib/assets/images/VisionImage.png")),
            ),
            if (deviceWidth > 675)
              Row(
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
                          MaterialPageRoute(
                            builder: (context) => const Modelpage(),
                          ),
                        );
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
                          MaterialPageRoute(
                            builder: (context) => const PhotographerPage(),
                          ),
                        );
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
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF6A6A6A), width: 2)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3E3E3).withOpacity(0.8)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OfferPage(),
                    ),
                  );
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
          ),
          Container(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
                padding: const EdgeInsets.all(0),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF6A6A6A), width: 2)),
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: _toggleIcon,
                    icon: Icon(
                      _isListIcon ? Icons.list_outlined : Icons.close,
                      color: const Color(0xFF6A6A6A),
                      size: 30,
                    ))),
          )
        ],
        backgroundColor: const Color(0xFFE3E3E3).withOpacity(0.8));
  }
}
