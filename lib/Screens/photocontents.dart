import 'package:flutter/material.dart';
import 'package:modelhp/components/animatedpositioned.dart';
import 'package:modelhp/components/footerforhomepage.dart';
import 'package:modelhp/components/header_excepthome.dart';
import 'package:modelhp/components/pdfview.dart';

class PhotoContents extends StatefulWidget {
  const PhotoContents({super.key});

  @override
  _PhotoContentsState createState() => _PhotoContentsState();
}

class _PhotoContentsState extends State<PhotoContents> {
  bool _isDrawerOpen = false;
  final ScrollController _scrollController = ScrollController();
  String _currentImage = 'lib/assets/images/photocontentpage/photocontent1.jpg';
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
        if (_scrollController.offset > 2500 + deviceheight * 4) {
          _currentImage =
              'lib/assets/images/photocontentpage/photocontent6.jpg';
        } else if (_scrollController.offset > 2000 + deviceheight * 3) {
          _currentImage =
              'lib/assets/images/photocontentpage/photocontent5.jpg';
        } else if (_scrollController.offset > 1500 + deviceheight * 2) {
          _currentImage =
              'lib/assets/images/photocontentpage/photocontent4.jpg';
        } else if (_scrollController.offset > 1000 + deviceheight) {
          _currentImage =
              'lib/assets/images/photocontentpage/photocontent3.jpg';
        } else if (_scrollController.offset > 500) {
          _currentImage =
              'lib/assets/images/photocontentpage/photocontent2.jpg';
        } else {
          _currentImage =
              'lib/assets/images/photocontentpage/photocontent1.jpg';
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
                            'フォト事業について',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            'Co.Atelierでは多くのカメラマンが活躍しています。',
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
                                  '皆様のご要望に沿った最適なカメラマンが写真撮影をさせていただきます',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '皆様のご要望に沿った最適なカメラマンが\n写真撮影をさせていただきます',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth > 380 ? 16 : 12),
                                  ),
                                ),
                          deviceWidth > 900
                              ? const Text(
                                  'ご期待以上のカメラマンと共に素晴らしい仕事をしてみませんか？',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ご期待以上のカメラマンと共に\n素晴らしい仕事をしてみませんか？',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth > 380 ? 16 : 12),
                                  ),
                                ),
                          Text(
                            '*納品物は全て写真加工までさせていただきます。',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 28
                                        : 14
                                    : 10),
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
                            'ポートレート撮影メニュー',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            'ポートレート撮影をご要望ですか？',
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
                                  'Co.Atelierで最適なポートレート撮影をお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最適なポートレート撮影\nをお届けします。',
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
                                      'ポートレート撮影',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・1人10枚まで\n・デジタルデータのみ\n・被写体が複数人ご希望の場合は人数分料金がかかります。\n・対応時間は2時間となります。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '31,980円',
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
                            'イベント撮影メニュー',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            'イベントや展示会での撮影は必要でしょうか？',
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
                                  'Co.Atelierでイベントや展示会用に最適なカメラマンをお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierでイベントや展示会用に\n最適なカメラマンをお届けします。',
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
                                      'イベント撮影',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・カメラマンが現地に赴きます。\n・1イベントにつき50枚の写真\n・ご希望があればフォトブックの作成可能\n・対応時間は4時間となります。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '67,980円',
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
                            '商品撮影',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            '商品撮影の依頼をご希望ですか？',
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
                                  'Co.Atelierで最適なカメラマンが最高の商品撮影をお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最適なカメラマンが\n最高の商品撮影をお届けします。',
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
                                      '商品撮影',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・全部で50枚となります。\n・デジタルデータのみ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '39,980円',
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
                            '編集加工メニュー',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            '写真の編集加工の依頼をご希望ですか？',
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
                                  'Co.Atelierでは編集加工のみのご依頼も承っております。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierでは編集加工のみ\nのご依頼も承っております。',
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
                                      '編集加工',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・肌の補正、背景変更、オブジェクト削除・追加、細かなディテール調整\n・複数枚の場合は×枚数。\n・デジタルデータのみ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '1,200円',
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
