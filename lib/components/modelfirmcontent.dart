import "package:flutter/material.dart";

class ModelFirmContent extends StatefulWidget {
  const ModelFirmContent({super.key});

  @override
  State<ModelFirmContent> createState() {
    return _ModelFirmContentState();
  }
}

class _ModelFirmContentState extends State<ModelFirmContent> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'モデル事務所名',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'Co.Atelier',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                '代表',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                '堀本修治',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 90),
              child: Text(
                '役員',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding:
                  EdgeInsets.only(top: 30, bottom: deviceWidth > 800 ? 30 : 51),
              child: Column(
                children: [
                  Text(
                    '吉田　陵',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceWidth > 800 ? 20 : 15),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '沖田篤哉',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceWidth > 800 ? 20 : 15),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '西村一輝',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceWidth > 800 ? 20 : 15),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                '事務所所属人数',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                '○○人(2025年2月)',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                '活動拠点',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                '福岡県福岡市',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'E-mail',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 15),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              width: deviceWidth > 800 ? 300 : 160,
              padding:
                  EdgeInsets.only(top: 30, bottom: deviceWidth > 800 ? 30 : 32),
              child: Text(
                'coatelier589@gmail.com',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceWidth > 800 ? 20 : 12),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ],
    );
  }
}
