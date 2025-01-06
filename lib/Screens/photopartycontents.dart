import 'package:flutter/material.dart';
import 'package:modelhp/components/animatedpositioned.dart';
import 'package:modelhp/components/footerforhomepage.dart';
import 'package:modelhp/components/header_excepthome.dart';
import 'package:modelhp/components/pdfview.dart';

class PhotoPartyContents extends StatefulWidget {
  const PhotoPartyContents({super.key});

  @override
  _PhotoPartyContentsState createState() => _PhotoPartyContentsState();
}

class _PhotoPartyContentsState extends State<PhotoPartyContents> {
  bool _isDrawerOpen = false;
  final ScrollController _scrollController = ScrollController();
  String _currentImage =
      'lib/assets/images/photopartycontentpage/photopartypage1.jpg';
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
              'lib/assets/images/photopartycontentpage/photopartypage5.jpg';
        } else if (_scrollController.offset > 1500 + deviceheight * 2) {
          _currentImage =
              'lib/assets/images/photopartycontentpage/photopartypage4.jpg';
        } else if (_scrollController.offset > 1000 + deviceheight) {
          _currentImage =
              'lib/assets/images/photopartycontentpage/photopartypage3.jpg';
        } else if (_scrollController.offset > 500) {
          _currentImage =
              'lib/assets/images/photopartycontentpage/photopartypage2.jpg';
        } else {
          _currentImage =
              'lib/assets/images/photopartycontentpage/photopartypage1.jpg';
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
                            '撮影企画運営事業について',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 900 ? 50 : 24),
                          ),
                          Text(
                            'Co.Atelierでは撮影企画運営をいくつも行っています',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  '皆様のご要望に沿った撮影会を企画運営いたします',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '皆様のご要望に沿った撮影会を\n企画運営いたします',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                          deviceWidth > 900
                              ? const Text(
                                  '我々と最高の撮影会の企画運営を行ってみませんか？',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '我々と最高の撮影会の企画運営\nを行ってみませんか？',
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
                            '撮影会の企画運営代行',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 900 ? 50 : 24),
                          ),
                          Text(
                            '撮影会の企画及び運営でお悩みはございますか？',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  'Co.Atelierでは撮影会についてあらゆるノウハウをご提供いたします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierでは撮影会について\nあらゆるノウハウをご提供いたします。',
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
                                      '撮影会企画立案及び運営代行',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・撮影会の企画をコンサルティング\n・撮影会の運営を代行',
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
                            'CO.Atlier主催撮影会',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 900 ? 50 : 24),
                          ),
                          Text(
                            'Co.Atlier主催の撮影会に参加してみませんか？',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  'Co.Atelierでは多くのモデルやカメラマンと定期的に撮影会を開催しています。一緒に最高の体験をしてみませんか？',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierでは多くのモデルやカメラマンと\n定期的に撮影会を開催しています。\n一緒に最高の体験をしてみませんか？',
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
                                      '基本価格(参加費用)',
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
                                      '撮影会参加',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・こちらで場所、モデル、カメラマンをご用意いたします。\n・告知は公式インスタグラムで行います。',
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
                            'レタッチ会',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 900 ? 50 : 24),
                          ),
                          Text(
                            'Co.Atelierでは技術力を高めるためレタッチ会を行っています。',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth > 900 ? 32 : 16),
                          ),
                          deviceWidth > 900
                              ? const Text(
                                  'Co.Atelierのレタッチ会に参加して、一緒に技術を高めてみませんか？',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierのレタッチ会に参加して\n一緒に技術を高めてみませんか？',
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
                                      '基本価格(参加費用)',
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
                                      'オフラインレタッチ会',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・こちらで場所をご用意します。\n・告知は公式インスタグラムで行います。',
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
                                      'オンラインレタッチ会',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              deviceWidth > 900 ? 20 : 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・こちらで会議設定を行います。\n・告知は公式インスタグラムで行います。',
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
