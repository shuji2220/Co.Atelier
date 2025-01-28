import 'package:flutter/material.dart';
import 'package:modelhp/components/animatedpositioned.dart';
import 'package:modelhp/components/footerforhomepage.dart';
import 'package:modelhp/components/header_excepthome.dart';
import 'package:modelhp/components/pdfview.dart';

class ModelContents extends StatefulWidget {
  const ModelContents({super.key});

  @override
  _ModelContentsState createState() => _ModelContentsState();
}

class _ModelContentsState extends State<ModelContents> {
  bool _isDrawerOpen = false;
  final ScrollController _scrollController = ScrollController();
  String _currentImage =
      'lib/assets/images/modelcontentpage/modelcontentpage1.jpg';
  double deviceheight = 0.0;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        deviceheight = MediaQuery.of(context).size.height;
      });
    });
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset > 2000 + deviceheight * 3) {
          _currentImage =
              'lib/assets/images/modelcontentpage/modelcontentpage5.jpg';
        } else if (_scrollController.offset > 1500 + deviceheight * 2) {
          _currentImage =
              'lib/assets/images/modelcontentpage/modelcontentpage4.jpg';
        } else if (_scrollController.offset > 1000 + deviceheight) {
          _currentImage =
              'lib/assets/images/modelcontentpage/modelcontentpage3.jpg';
        } else if (_scrollController.offset > 500) {
          _currentImage =
              'lib/assets/images/modelcontentpage/modelcontentpage2.jpg';
        } else {
          _currentImage =
              'lib/assets/images/modelcontentpage/modelcontentpage1.jpg';
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _openPDF() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PDFViewerPage(
            pdfPath: 'lib/assets/card.pdf'), // Replace with your PDF file path
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: HeaderforExceptHomepage(onToggleDrawer: _toggleDrawer),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: SizedBox(
                  width: deviceWidth,
                  height: 500,
                  child: Image.asset(
                    _currentImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Opacity(
                      opacity: 1,
                      child: SizedBox(
                        width: deviceWidth,
                        height: 500,
                      ),
                    ),
                    Container(
                      width: deviceWidth,
                      height: deviceHeight,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'モデル事業について',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            'Co.Atelierでは多くのモデルが活躍しています。',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 32
                                        : 16
                                    : 12),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  '皆様のご要望に沿った最適なモデルを派遣させていただきます',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '皆様のご要望に沿った最適なモデルを\n派遣させていただきます',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth > 380 ? 16 : 12),
                                  ),
                                ),
                          deviceWidth > 900
                              ? const Text(
                                  'ご期待以上のモデルと共に素晴らしい仕事をしてみませんか？',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ご期待以上のモデルと共に\n素晴らしい仕事をしてみませんか？',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth > 380 ? 16 : 12),
                                  ),
                                ),
                          Text(
                            '*価格は交渉次第で変更となります。',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 32
                                        : 16
                                    : 12),
                          ),
                          Text(
                            '詳細なメニューは下記チラシをご覧ください',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 32
                                        : 16
                                    : 12),
                          ),
                          TextButton(
                              onPressed: _openPDF,
                              child: Text(
                                'チラシを見る',
                                style: TextStyle(
                                    fontSize: deviceWidth > 900 ? 32 : 12),
                              )),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 1,
                      child: SizedBox(
                        width: deviceWidth,
                        height: 500,
                      ),
                    ),
                    Container(
                      width: deviceWidth,
                      height: deviceHeight,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'ポートレート撮影モデル派遣',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            'ポートレート撮影用のモデルをお探しですか？',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 32
                                        : 16
                                    : 12),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  'Co.Atelierで最適なポートレート撮影用のモデルをお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最適なポートレート撮影用の\nモデルをお届けします。',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth > 380 ? 16 : 12),
                                  ),
                                ),
                          Table(
                            border: TableBorder.all(color: Colors.white),
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                decoration:
                                    BoxDecoration(color: Colors.grey[900]),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'プラン名',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'プラン内容',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '基本価格',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'ポートレート撮影モデル派遣',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・撮影時間に合わせてモデルが現地へ赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。\n・対応時間2時間を想定。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '23,980円',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '詳細なメニューは下記チラシをご覧ください',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 32
                                        : 16
                                    : 12),
                          ),
                          TextButton(
                              onPressed: _openPDF,
                              child: Text(
                                'チラシを見る',
                                style: TextStyle(
                                    fontSize: deviceWidth > 900 ? 20 : 12),
                              )),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 1,
                      child: SizedBox(
                        width: deviceWidth,
                        height: 500,
                      ),
                    ),
                    Container(
                      width: deviceWidth,
                      height: deviceHeight,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'イベント・ファッションショーモデル派遣',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            'イベントやファッションショーでモデルを起用してみませんか？',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 32
                                        : 16
                                    : 12),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  'Co.Atelierで最適なイベントやファッションショー用のモデルをお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最適なイベントやファッションショー用\nのモデルをお届けします。',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth > 380 ? 16 : 12),
                                  ),
                                ),
                          Table(
                            border: TableBorder.all(color: Colors.white),
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                decoration:
                                    BoxDecoration(color: Colors.grey[900]),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'プラン名',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'プラン内容',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '基本価格',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'イベント・ファッションショー\nモデル派遣',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・モデルが現地へ赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。\n・対応時間は4時間を想定してます。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '35,980円',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '詳細なメニューは下記チラシをご覧ください',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 32
                                        : 16
                                    : 12),
                          ),
                          TextButton(
                              onPressed: _openPDF,
                              child: Text(
                                'チラシを見る',
                                style: TextStyle(
                                    fontSize: deviceWidth > 900 ? 20 : 12),
                              )),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 1,
                      child: SizedBox(
                        width: deviceWidth,
                        height: 500,
                      ),
                    ),
                    Container(
                      width: deviceWidth,
                      height: deviceHeight,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '映像用モデル派遣',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            '映像撮影用のモデルをお探しですか？',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  'Co.Atelierで最適な映像撮影用のモデルをお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最適な映像撮影用の\nモデルをお届けします。',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth > 380 ? 16 : 12),
                                  ),
                                ),
                          Table(
                            border: TableBorder.all(color: Colors.white),
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                decoration:
                                    BoxDecoration(color: Colors.grey[900]),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'プラン名',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'プラン内容',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '基本価格',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 24 : 10),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '映像撮影用モデルプラン',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・撮影時間に合わせてモデルが現地へ赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。\n・セリフ暗記対応\n・パフォーマンス対応\n・対応時間は8時間を想定します。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '57,980円',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '詳細なメニューは下記チラシをご覧ください',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 32
                                        : 16
                                    : 12),
                          ),
                          TextButton(
                              onPressed: _openPDF,
                              child: Text(
                                'チラシを見る',
                                style: TextStyle(
                                    fontSize: deviceWidth > 900 ? 20 : 12),
                              )),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 1,
                      child: SizedBox(
                        width: deviceWidth,
                        height: 500,
                      ),
                    ),
                    const FooterforHomepage(),
                  ],
                ),
              ),
            ],
          ),
          CustomAnimatedPositioned(
              isDrawerOpen: _isDrawerOpen, deviceWidth: deviceWidth)
        ],
      ),
    );
  }
}
