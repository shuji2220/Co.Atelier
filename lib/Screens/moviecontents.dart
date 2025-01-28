import 'package:flutter/material.dart';
import 'package:modelhp/components/animatedpositioned.dart';
import 'package:modelhp/components/footerforhomepage.dart';
import 'package:modelhp/components/header_excepthome.dart';
import 'package:modelhp/components/pdfview.dart';
import 'package:video_player/video_player.dart';

class MovieContents extends StatefulWidget {
  const MovieContents({super.key});

  @override
  _MovieContentsState createState() => _MovieContentsState();
}

class _MovieContentsState extends State<MovieContents> {
  bool _isDrawerOpen = false;
  late VideoPlayerController _controller;
  final ScrollController _scrollController = ScrollController();

  double deviceheight = 0.0;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'lib/assets/images/moviecontentpage/video.mp4') // Replace with your video asset path
      ..initialize().then((_) {
        setState(() {});
        _controller.setVolume(
            0); // Ensure the first frame is shown after the video is initialized
        _controller.play(); // Automatically play the video after initialization
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
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
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const Center(child: CircularProgressIndicator()),
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
                            '映像事業について',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            'Co.AtelierではPRやショート動画撮影及び編集加工を行っています',
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
                                  '皆様のご要望に沿った動画を作成しております',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '皆様のご要望に沿った動画を\n作成しております',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth > 380 ? 16 : 12),
                                  ),
                                ),
                          deviceWidth > 900
                              ? const Text(
                                  'ご期待以上の動画の作成をご依頼してみませんか？',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ご期待以上の動画の作成を\nご依頼してみませんか？',
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
                            '動画作成メニュー',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: deviceWidth > 380
                                    ? deviceWidth > 900
                                        ? 50
                                        : 24
                                    : 16),
                          ),
                          Text(
                            '動画の作成をご要望ですか？',
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
                                  'Co.Atelierで最高の動画をお届けします。',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Co.Atelierで最高の動画\nをお届けします。',
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
                                      'ショート動画作成プラン',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・動画用の撮影を行います。\n・最高の動画編集をご提供します。\n・最大撮影対応時間：6時間',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '34,980円',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'インタビュー動画作成プラン',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '・インタビュー動画の撮影を行います。\n・最高の動画編集をご提供します。\n・最大撮影対応時間：6時間',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth > 900 ? 20 : 8),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '54,980円',
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
