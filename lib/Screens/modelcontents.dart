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
                                fontSize: deviceWidth > 900 ? 50 : 24),
                          ),
                          Text(
                            'Co.Atelierでは多くのモデルが活躍しています。',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  '皆様のご要望に沿った最適なモデルを派遣させていただきます',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '皆様のご要望に沿った最適なモデルを\n派遣させていただきます',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                          deviceWidth > 900
                              ? const Text(
                                  'ご期待以上のモデルと共に素晴らしい仕事をしてみませんか？',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ご期待以上のモデルと共に\n素晴らしい仕事をしてみませんか？',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                          Text(
                            '詳細なメニューは下記チラシをご覧ください',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          TextButton(
                              onPressed: _openPDF,
                              child: Text(
                                'チラシを見る',
                                style: TextStyle(
                                    fontSize: deviceWidth > 900 ? 32 : 16),
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
                                fontSize: deviceWidth > 900 ? 50 : 24),
                          ),
                          Text(
                            'ポートレート撮影用のモデルをお探しですか？',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  'Co.Atelierで最適なポートレート撮影用のモデルをお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最適なポートレート撮影用の\nモデルをお届けします。',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
                                      '基本価格\n(1時間単位)',
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
                                      'ベーシックプラン',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・撮影時間に合わせてモデルが現地へ赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'プレミアムプラン',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・撮影時間に合わせてモデルが現地へ赴きます。\n・ヘアメイク及びスタイリストも赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
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
                                fontSize: deviceWidth > 900 ? 20 : 16),
                          ),
                          TextButton(
                              onPressed: _openPDF,
                              child: Text(
                                'チラシを見る',
                                style: TextStyle(
                                    fontSize: deviceWidth > 900 ? 20 : 16),
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
                            'イベント・展示会モデル派遣',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 900 ? 50 : 24),
                          ),
                          Text(
                            'イベントや展示会でモデルを起用してみませんか？',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  'Co.Atelierで最適なイベントや展示会用のモデルをお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最適なイベントや展示会用の\nモデルをお届けします。',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
                                      '基本価格(1時間単位)',
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
                                      '展示会・ブーススタッフモデル',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・展示会やブーススタッフモデルが現地へ赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'セミナー・パネルディスカッションモデル',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・セミナー等にモデルが現地へ赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'ファッションショーモデル',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・ファッションショーにモデルが現地へ赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            '詳細なメニューは下記チラシをご覧ください',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 20 : 16),
                          ),
                          TextButton(
                              onPressed: _openPDF,
                              child: Text(
                                'チラシを見る',
                                style: TextStyle(
                                    fontSize: deviceWidth > 900 ? 20 : 16),
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
                                fontSize: deviceWidth > 900 ? 50 : 24),
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
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最適な映像撮影用の\nモデルをお届けします。',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
                                      '基本価格(1時間単位)',
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
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・撮影時間に合わせてモデルが現地へ赴きます。\n・モデルを複数人ご希望の場合は人数分料金がかかります。\n・セリフ暗記対応\n・パフォーマンス対応',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
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
                                fontSize: deviceWidth > 900 ? 20 : 16),
                          ),
                          TextButton(
                              onPressed: _openPDF,
                              child: Text(
                                'チラシを見る',
                                style: TextStyle(
                                    fontSize: deviceWidth > 900 ? 20 : 16),
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
