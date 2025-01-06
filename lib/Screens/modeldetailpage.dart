import 'package:flutter/material.dart';
import 'package:modelhp/Screens/zoomphoto.dart';

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

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final List<String> subphotos = List<String>.from(widget.item['subphoto']);
    final List<String> categories = List<String>.from(widget.item['category']);

    return Flexible(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: Container(
                  height: deviceHeight,
                  width: deviceWidth > 800 ? 800 : deviceWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.item['photo0']),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.8), BlendMode.darken),
                      opacity: 0.4,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: ClipRRect(
                                child: Image.asset(
                                  widget.item['photo1'],
                                  width: deviceWidth > 800
                                      ? deviceWidth * 0.18
                                      : deviceWidth * 0.5,
                                  height: 310,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                width: deviceWidth > 800
                                    ? deviceWidth * 0.27
                                    : deviceWidth * 0.5,
                                height: 310,
                                child: Column(
                                  children: [
                                    Text(
                                      widget.item['modelname'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              deviceWidth > 800 ? 48 : 28),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: deviceWidth > 800
                                              ? deviceWidth * 0.135
                                              : deviceWidth * 0.25,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: deviceWidth > 800
                                                        ? 20
                                                        : 8),
                                                child: Text(
                                                  'Size(cm)',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          deviceWidth > 800
                                                              ? 28
                                                              : 12),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: deviceWidth > 800
                                                        ? 28
                                                        : 16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Height:${widget.item['detail']['Height']}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              deviceWidth > 800
                                                                  ? 20
                                                                  : 12),
                                                    ),
                                                    Text(
                                                      'Bust:${widget.item['detail']['Bust']}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              deviceWidth > 800
                                                                  ? 20
                                                                  : 12),
                                                    ),
                                                    Text(
                                                      'Waist:${widget.item['detail']['Waist']}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              deviceWidth > 800
                                                                  ? 20
                                                                  : 12),
                                                    ),
                                                    Text(
                                                      'Hip:${widget.item['detail']['Hip']}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              deviceWidth > 800
                                                                  ? 20
                                                                  : 12),
                                                    ),
                                                    Text(
                                                      'Shoes:${widget.item['detail']['Shoes']}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              deviceWidth > 800
                                                                  ? 20
                                                                  : 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: deviceWidth > 800
                                              ? deviceWidth * 0.135
                                              : deviceWidth * 0.25,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Category',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: deviceWidth > 800
                                                        ? 28
                                                        : 12),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children:
                                                    categories.map((category) {
                                                  return Text(
                                                    category,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          deviceWidth > 800
                                                              ? 20
                                                              : 12,
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
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
                                            color: Colors.white54),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ZoomPhoto(
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
