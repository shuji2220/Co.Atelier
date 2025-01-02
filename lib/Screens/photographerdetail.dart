import 'package:flutter/material.dart';
import 'package:modelhp/Screens/zoomphoto.dart';

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

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final List<String> photos =
        List<String>.from(widget.photographer['photos']);

    return Flexible(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: Container(
                  height: deviceHeight,
                  width: deviceWidth > 650 ? 650 : deviceWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.photographer['mainphoto']),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.8), BlendMode.darken),
                      opacity: 0.4,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: deviceHeight > 600 ? 40 : 10,
                        ),
                        Text(widget.photographer['name'],
                            style: const TextStyle(
                              fontSize: 60,
                              color: Colors.black,
                            )),
                        Text(widget.photographer['furigana'],
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            )),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '【活動エリア】',
                                  style: TextStyle(
                                      fontSize: deviceWidth > 650 ? 24 : 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                for (var i = 0;
                                    i < widget.photographer['活動エリア'].length;
                                    i++)
                                  Text(
                                    widget.photographer['活動エリア'][i],
                                    style: TextStyle(
                                        fontSize: deviceWidth > 650 ? 24 : 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                Text('【ご依頼可能な日時】',
                                    style: TextStyle(
                                        fontSize: deviceWidth > 650 ? 24 : 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                for (var i = 0;
                                    i < widget.photographer['ご依頼可能な日時'].length;
                                    i++)
                                  Text(widget.photographer['ご依頼可能な日時'][i],
                                      style: TextStyle(
                                          fontSize: deviceWidth > 650 ? 24 : 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text('【撮影ジャンル】',
                            style: TextStyle(
                                fontSize: deviceWidth > 650 ? 24 : 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0;
                                i < widget.photographer['撮影ジャンル'].length;
                                i++)
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Text(widget.photographer['撮影ジャンル'][i],
                                    style: TextStyle(
                                        fontSize: deviceWidth > 650 ? 24 : 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: deviceHeight - 330,
                          child: Center(
                            child: Stack(
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: deviceWidth > 650 ? 300 : 250,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        iconSize: deviceWidth > 650 ? 80 : 40,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_left,
                                            color: Colors.white54),
                                        onPressed: _previousPage,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: deviceWidth > 650 ? 400 : 300,
                                    height: deviceWidth > 650 ? 300 : 250,
                                    child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: photos.length,
                                      itemBuilder: (context, index) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ZoomPhoto(
                                                    photoPath: photos[index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Image.asset(
                                              photos[index],
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
                                    height: deviceWidth > 650 ? 300 : 250,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        iconSize: deviceWidth > 650 ? 80 : 40,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white54),
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
          )),
    );
  }
}
