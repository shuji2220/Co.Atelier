import 'package:flutter/material.dart';
import 'package:modelhp/Screens/zoomphoto.dart';
import 'package:url_launcher/url_launcher.dart';

class PhotographerDetail extends StatefulWidget {
  final Map<String, dynamic> photographer;

  const PhotographerDetail({super.key, required this.photographer});

  @override
  _PhotographerDetailState createState() => _PhotographerDetailState();
}

class _PhotographerDetailState extends State<PhotographerDetail> {
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
    if (_currentPage < widget.photographer['photos'].length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchInstagramURL() async {
    final url = Uri.parse(widget.photographer['instagram']);
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

    final List<String> photos =
        List<String>.from(widget.photographer['photos']);

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
                    image: AssetImage(widget.photographer['mainphoto']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: deviceHeight > 800 ? 40 : 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(widget.photographer['name'],
                                  style: TextStyle(
                                    fontSize: deviceWidth > 800 ? 40 : 24,
                                    color: Colors.white,
                                  )),
                              Text(widget.photographer['furigana'],
                                  style: TextStyle(
                                    fontSize: deviceWidth > 800 ? 24 : 16,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          IconButton(
                            onPressed: _launchInstagramURL,
                            icon:
                                Image.asset('lib/assets/images/Instagram.png'),
                            iconSize: 24,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                '【活動エリア】',
                                style: TextStyle(
                                    fontSize: deviceWidth > 800 ? 24 : 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              for (var i = 0;
                                  i < widget.photographer['活動エリア'].length;
                                  i++)
                                Text(
                                  widget.photographer['活動エリア'][i],
                                  style: TextStyle(
                                      fontSize: deviceWidth > 800 ? 24 : 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                            ],
                          ),
                          const SizedBox(width: 40),
                          Column(
                            children: [
                              Text('【ご依頼可能な日時】',
                                  style: TextStyle(
                                      fontSize: deviceWidth > 800 ? 24 : 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              for (var i = 0;
                                  i < widget.photographer['ご依頼可能な日時'].length;
                                  i++)
                                Text(widget.photographer['ご依頼可能な日時'][i],
                                    style: TextStyle(
                                        fontSize: deviceWidth > 800 ? 24 : 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('【撮影ジャンル】',
                          style: TextStyle(
                              fontSize: deviceWidth > 800 ? 24 : 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      widget.photographer['撮影ジャンル'].length < 3
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var i = 0;
                                    i < widget.photographer['撮影ジャンル'].length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: Text(
                                        widget.photographer['撮影ジャンル'][i],
                                        style: TextStyle(
                                            fontSize:
                                                deviceWidth > 800 ? 24 : 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (var i = 0; i < 3; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Text(
                                            widget.photographer['撮影ジャンル'][i],
                                            style: TextStyle(
                                                fontSize:
                                                    deviceWidth > 800 ? 24 : 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (var i = 3;
                                        i <
                                            widget
                                                .photographer['撮影ジャンル'].length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Text(
                                            widget.photographer['撮影ジャンル'][i],
                                            style: TextStyle(
                                                fontSize:
                                                    deviceWidth > 800 ? 24 : 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                  ],
                                )
                              ],
                            ),
                      SizedBox(
                        height: deviceHeight - 330,
                        child: Center(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: deviceWidth > 800 ? 300 : 250,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    iconSize: deviceWidth > 800 ? 80 : 40,
                                    icon: const Icon(Icons.keyboard_arrow_left,
                                        color: Colors.white54),
                                    onPressed: _previousPage,
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: deviceWidth > 800 ? 400 : 280,
                                  height: deviceWidth > 800 ? 300 : 210,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    itemCount: photos.length,
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) =>
                                                      ZoomPhoto(
                                                        photoPath:
                                                            photos[index],
                                                      ),
                                                  transitionDuration:
                                                      Duration.zero),
                                            );
                                          },
                                          child: Image.asset(
                                            photos[index],
                                            fit: BoxFit.cover,
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
                              SizedBox(
                                height: deviceWidth > 800 ? 300 : 250,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    iconSize: deviceWidth > 800 ? 80 : 40,
                                    icon: const Icon(Icons.keyboard_arrow_right,
                                        color: Colors.white54),
                                    onPressed: _nextPage,
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
