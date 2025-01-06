import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

class VisionImage extends StatefulWidget {
  const VisionImage({super.key});
  @override
  State<VisionImage> createState() {
    return _VisionImageState();
  }
}

class _VisionImageState extends State<VisionImage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            width: deviceWidth * 7 / 8,
            height: deviceHeight * 2 / 3,
            child:
                Image.asset('lib/assets/images/mapsforhomepage/mapsforhp.jpg'),
          ),
        ),
        Column(
          children: [
            Text(
              "Co.Atelier",
              style: TextStyle(
                fontSize: deviceWidth > 800 ? 100 : 50,
                color: const Color(0xFFe6e6e6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            FadeIn(
              globalKey: GlobalKey(),
              repeat: false,
              duration: 6.seconds,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth:
                      deviceWidth > 800 ? deviceWidth * 3 / 4 : deviceWidth,
                  maxHeight: deviceHeight * 3 / 4,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "ここは、本来であればバラバラだったはずの個性や才能たちが集うアトリエ。",
                        style: TextStyle(
                          fontSize: deviceWidth > 800 ? 20 : 12,
                          color: const Color(0xFFe6e6e6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "Co「Commonality」",
                      style: TextStyle(
                        fontSize: deviceWidth > 800 ? 20 : 12,
                        color: const Color(0xFFe6e6e6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "ある集団や物事の間に存在する共通の特徴や性質を指す",
                      style: TextStyle(
                        fontSize: deviceWidth > 800 ? 20 : 12,
                        color: const Color(0xFFe6e6e6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Atelier",
                      style: TextStyle(
                        fontSize: deviceWidth > 800 ? 20 : 12,
                        color: const Color(0xFFe6e6e6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "フランス語で芸術家が仕事を行うための専用の作業場のこと",
                      style: TextStyle(
                        fontSize: deviceWidth > 800 ? 20 : 12,
                        color: const Color(0xFFe6e6e6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "英語でスタジオ(studio)と呼ばれ写真家・芸術家などの仕事場のこと",
                      style: TextStyle(
                        fontSize: deviceWidth > 800 ? 20 : 12,
                        color: const Color(0xFFe6e6e6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          Text(
                            "それぞれの道を邁進する強烈な熱量という共通点を縁に、才能を磨き合い、価値を創造する。",
                            style: TextStyle(
                              fontSize: deviceWidth > 800 ? 20 : 12,
                              color: const Color(0xFFe6e6e6),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "我々Co.Atelierは、夢を追い求める個性たちを繋ぎ合わせ、飛躍させることで社会への貢献を目指します。",
                            style: TextStyle(
                              fontSize: deviceWidth > 800 ? 20 : 12,
                              color: const Color(0xFFe6e6e6),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
