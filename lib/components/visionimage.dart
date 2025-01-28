import 'package:flutter/material.dart';

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
          opacity: 0.4,
          child: SizedBox(
            width: deviceWidth,
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
            Container(
              constraints: BoxConstraints(
                maxWidth: deviceWidth > 800 ? deviceWidth * 3 / 4 : deviceWidth,
                maxHeight: deviceHeight * 2 / 5,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Commonality . Atelier＿＿",
                          style: TextStyle(
                            fontSize: deviceWidth > 800 ? 24 : 12,
                            color: const Color(0xFFe6e6e6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "～ あなたの魅力を。Co.Atelierで＿＿ ～",
                          style: TextStyle(
                            fontSize: deviceWidth > 800 ? 24 : 12,
                            color: const Color(0xFFe6e6e6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Co.Atelierは福岡を拠点にモデル・フォト・映像・撮影企画の事業を手掛けております。",
                          style: TextStyle(
                            fontSize: deviceWidth > 800 ? 24 : 12,
                            color: const Color(0xFFe6e6e6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "当方のモデル、カメラマンが最大限、クライアントの魅力を引き出す事をお約束いたします。",
                          style: TextStyle(
                            fontSize: deviceWidth > 800 ? 24 : 12,
                            color: const Color(0xFFe6e6e6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                      child: Text(
                        "我々Co.Atelierの世界を、ぜひご堪能下さい。",
                        style: TextStyle(
                          fontSize: deviceWidth > 800 ? 24 : 12,
                          color: const Color(0xFFe6e6e6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
