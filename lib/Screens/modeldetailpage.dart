import 'package:flutter/material.dart';
import 'package:modelhp/Screens/zoomphoto.dart';
import 'package:url_launcher/url_launcher.dart';

class ModelDetailPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const ModelDetailPage({super.key, required this.item});
  @override
  _ModelDetailPageState createState() => _ModelDetailPageState();
}

class _ModelDetailPageState extends State<ModelDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() {
    if (_currentPage < widget.item['subphoto'].length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchInstagramURL() async {
    final url = Uri.parse(widget.item['instagram']);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final List<String> subphotos = List<String>.from(widget.item['subphoto']);
    final List<String> categories = List<String>.from(widget.item['category']);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: Container(
                height: deviceHeight,
                width: deviceWidth > 800 ? 800 : deviceWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.item['photo1']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: deviceHeight > 800 ? 40 : 10,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      widget.item['modelname'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 800 ? 42 : 24),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: _launchInstagramURL,
                                  icon: Image.asset(
                                      'lib/assets/images/Instagram.png'),
                                  iconSize: 24,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Size(cm)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 1000
                                              ? deviceWidth > 600
                                                  ? 24
                                                  : 16
                                              : 14),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Height:${widget.item['detail']['Height']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: deviceWidth > 1000
                                                  ? deviceWidth > 600
                                                      ? 24
                                                      : 16
                                                  : 14),
                                        ),
                                        Text(
                                          'Bust:${widget.item['detail']['Bust']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: deviceWidth > 1000
                                                  ? deviceWidth > 600
                                                      ? 24
                                                      : 16
                                                  : 14),
                                        ),
                                        Text(
                                          'Waist:${widget.item['detail']['Waist']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: deviceWidth > 1000
                                                  ? deviceWidth > 600
                                                      ? 24
                                                      : 16
                                                  : 14),
                                        ),
                                        Text(
                                          'Hip:${widget.item['detail']['Hip']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: deviceWidth > 1000
                                                  ? deviceWidth > 600
                                                      ? 24
                                                      : 16
                                                  : 14),
                                        ),
                                        Text(
                                          'Shoes:${widget.item['detail']['Shoes']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: deviceWidth > 1000
                                                  ? deviceWidth > 600
                                                      ? 24
                                                      : 16
                                                  : 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Category',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 1000
                                              ? deviceWidth > 600
                                                  ? 24
                                                  : 16
                                              : 14),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: categories.map((category) {
                                        return Text(
                                          category,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: deviceWidth > 1000
                                                  ? deviceWidth > 600
                                                      ? 24
                                                      : 16
                                                  : 14),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: deviceHeight - 330,
                        child: Center(
                          child: Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  height: 300,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      iconSize: deviceWidth > 800 ? 80 : 40,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_left,
                                          color: Colors.white),
                                      onPressed: _previousPage,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: deviceWidth > 800
                                      ? deviceWidth * 0.35
                                      : deviceWidth * 0.6,
                                  height: 300,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    itemCount: subphotos.length,
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ZoomPhoto(
                                                  photoPath: subphotos[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            subphotos[index],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      );
                                    },
                                    onPageChanged: (index) {
                                      setState(() {
                                        _currentPage = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  height: 300,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      iconSize: deviceWidth > 800 ? 80 : 40,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.white),
                                      onPressed: _nextPage,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ));
  }
}
