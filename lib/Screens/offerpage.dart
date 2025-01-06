import 'package:flutter/material.dart';
import 'package:modelhp/components/animatedpositioned.dart';
import 'package:modelhp/components/footerforhomepage.dart';
import 'package:modelhp/components/header_excepthome.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  bool _isDrawerOpen = false;
  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: HeaderforExceptHomepage(onToggleDrawer: _toggleDrawer),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('案件のご依頼は以下の３つから受付可能です。',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'ご依頼いただきましたら、以下のメールアドレスから返信させていただきます。',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'メールアドレス：coatelier589@gmail.com',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: deviceWidth * 7 / 8,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '1：Google Formから依頼を行う',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '以下のGoogle Formからご記入いただき、ご依頼可能です。',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ーどの事業でのご依頼ですか。（必須）',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ー連絡先メールアドレス（必須）',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ー連絡先電話番号（任意）',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ーどのプランをお考えでしょうか。（任意）',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ー自由記述(任意)',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ーご指名したいモデルやカメラマンがいればご記入ください。(任意)',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 240,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your button action here
                                  },
                                  child: const Text('Google Form',
                                      style: TextStyle(fontSize: 16)),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: deviceWidth * 7 / 8,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '2：公式インスタグラムから依頼を行う',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '以下の項目を公式インスタグラム宛にご連絡いただくことで、ご依頼可能です。',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ーどの事業でのご依頼ですか。（必須）',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ー連絡先メールアドレス（必須）',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ー連絡先電話番号（任意）',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ーどのプランをお考えでしょうか。（任意）',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ー自由記述(任意)',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                'ーご指名したいモデルやカメラマンがいればご記入ください。(任意)',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 240,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your button action here
                                  },
                                  child: Row(
                                    children: [
                                      const Text('公式インスタグラム',
                                          style: TextStyle(fontSize: 16)),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                              'lib/assets/images/Instagram.png')),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: deviceWidth * 7 / 8,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3：メールから直接依頼を行う',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Co.Atelierのメールアドレスから以下をご記入いただき、ご依頼可能です。',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'ーどの事業でのご依頼ですか。（必須）',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'ー連絡先メールアドレス（必須）',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'ー連絡先電話番号（任意）',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'ーどのプランをお考えでしょうか。（任意）',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'ー自由記述(任意)',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'ーご指名したいモデルやカメラマンがいればご記入ください。(任意)',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '以下のGmail宛にご依頼ください。',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '連絡先メールアドレス：coatelier589@gmail.com',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const FooterforHomepage(),
              ],
            ),
          ),
          CustomAnimatedPositioned(
              isDrawerOpen: _isDrawerOpen, deviceWidth: deviceWidth)
        ],
      ),
    );
  }
}
