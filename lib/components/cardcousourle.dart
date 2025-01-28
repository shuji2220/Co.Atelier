import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Cardcousourle extends StatefulWidget {
  const Cardcousourle({super.key});
  @override
  State<Cardcousourle> createState() {
    return _CardcousourleState();
  }
}

class _CardcousourleState extends State<Cardcousourle> {
  final images = [
    "lib/assets/images/Home1.jpg",
    "lib/assets/images/Home2.jpg",
    "lib/assets/images/Home3.jpg",
    "lib/assets/images/Home4.jpg",
    "lib/assets/images/Home5.jpg",
    "lib/assets/images/Home6.jpg",
  ];
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            initialPage: 0,
            autoPlay: true,
            onPageChanged: (index, reason) => setState(() {
              activeIndex = index;
            }),
          ),
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            final path = images[index];
            return Container(
              width: deviceWidth,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 20),
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  path,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        Container(
          width: deviceWidth,
          height: deviceHeight * 7 / 8,
          alignment: Alignment.center,
          child: Opacity(
              opacity: 0.8,
              child: Image.asset("lib/assets/images/CardCousorle.png")),
        ),
      ],
    );
  }
}
