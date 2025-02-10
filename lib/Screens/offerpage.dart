import 'package:flutter/material.dart';
import 'package:modelhp/Screens/test.dart';
import 'package:modelhp/components/animatedpositioned.dart';
import 'package:modelhp/components/footerforhomepage.dart';
import 'package:modelhp/components/header_excepthome.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchGoogleFormURL() async {
    final url = Uri.parse(
        'https://docs.google.com/forms/d/e/1FAIpQLSc1Zwz2SWHt7Snmw0TVh_BSX4M4z0UuYnjvbRHf1Z_njheuaA/viewform');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInstagramURL() async {
    final url = Uri.parse('https://www.instagram.com/co.atelier_official/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
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
                deviceWidth > 380
                    ? deviceWidth > 800
                        ? const Text('案件のご依頼は以下の３つから受付可能です。',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.white))
                        : const Text('案件のご依頼は\n以下の３つから受付可能です。',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.white))
                    : const Text('案件のご依頼は\n以下の３つから受付可能です。',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                deviceWidth > 380
                    ? deviceWidth > 800
                        ? const Text(
                            'ご依頼いただきましたら以下のメールアドレスから返信させていただきます。',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        : const Text(
                            'ご依頼いただきましたら\n以下のメールアドレスから\n返信させていただきます。',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                    : const Text(
                        'ご依頼いただきましたら\n以下のメールアドレスから\n返信させていただきます。',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'メールアドレス：coatelier589@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: deviceWidth > 380
                          ? deviceWidth > 800
                              ? 18
                              : 16
                          : 12,
                      color: Colors.white),
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
                              Text(
                                '1：Google Formから依頼を行う',
                                style: TextStyle(
                                  fontSize: deviceWidth > 800 ? 20 : 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              deviceWidth > 400
                                  ? Text(
                                      '以下のGoogle Formからご記入いただきご依頼可能です。',
                                      style: TextStyle(
                                          fontSize:
                                              deviceWidth > 800 ? 18 : 14),
                                    )
                                  : const Text(
                                      '以下のGoogle Formから\nご記入いただきご依頼可能です。',
                                      style: TextStyle(fontSize: 10),
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'ーメールアドレス（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー御社名または個人名（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーお客様担当者名（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーどのジャンルでご依頼いたしますか？（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーCo.Atelier販売者名（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー連絡先電話番号（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーどのプランをお考えでしょうか（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー自由記述(任意)',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              deviceWidth > 400
                                  ? Text(
                                      'ーご指名したいモデルやカメラマンがいればご記入ください。(任意)',
                                      style: TextStyle(
                                          fontSize:
                                              deviceWidth > 800 ? 18 : 14),
                                    )
                                  : const Text(
                                      'ーご指名したいモデルやカメラマンが\nいればご記入ください。(任意)',
                                      style: TextStyle(fontSize: 10),
                                    ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 240,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: _launchGoogleFormURL,
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
                              Text(
                                '2：公式インスタグラムから依頼を行う',
                                style: TextStyle(
                                  fontSize: deviceWidth > 800 ? 20 : 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              deviceWidth > 400
                                  ? Text(
                                      '以下の項目を公式インスタグラムにご連絡ください。',
                                      style: TextStyle(
                                          fontSize:
                                              deviceWidth > 800 ? 18 : 14),
                                    )
                                  : const Text(
                                      '以下の項目を公式インスタグラムに\nご連絡ください。',
                                      style: TextStyle(fontSize: 10),
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'ーメールアドレス（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー御社名または個人名（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーお客様担当者名（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーどのジャンルでご依頼いたしますか？（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーCo.Atelier販売者名（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー連絡先電話番号（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーどのプランをお考えでしょうか（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー自由記述(任意)',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              deviceWidth > 400
                                  ? Text(
                                      'ーご指名したいモデルやカメラマンがいればご記入ください。(任意)',
                                      style: TextStyle(
                                          fontSize:
                                              deviceWidth > 800 ? 18 : 14),
                                    )
                                  : const Text(
                                      'ーご指名したいモデルやカメラマンが\nいればご記入ください。(任意)',
                                      style: TextStyle(fontSize: 10),
                                    ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 240,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: _launchInstagramURL,
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
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3：メールから直接依頼を行う',
                                style: TextStyle(
                                  fontSize: deviceWidth > 800 ? 20 : 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              deviceWidth > 400
                                  ? Text(
                                      'メールアドレスから以下をご記入いただきご依頼可能です。',
                                      style: TextStyle(
                                          fontSize:
                                              deviceWidth > 800 ? 18 : 14),
                                    )
                                  : const Text(
                                      'メールアドレスから以下を\nご記入いただきご依頼可能です。',
                                      style: TextStyle(fontSize: 10),
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'ーメールアドレス（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー御社名または個人名（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーお客様担当者名（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーどのジャンルでご依頼いたしますか？（必須）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーCo.Atelier販売者名（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー連絡先電話番号（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ーどのプランをお考えでしょうか（任意）',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                'ー自由記述(任意)',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              deviceWidth > 400
                                  ? Text(
                                      'ーご指名したいモデルやカメラマンがいればご記入ください。(任意)',
                                      style: TextStyle(
                                          fontSize:
                                              deviceWidth > 800 ? 18 : 14),
                                    )
                                  : const Text(
                                      'ーご指名したいモデルやカメラマンが\nいればご記入ください。(任意)',
                                      style: TextStyle(fontSize: 10),
                                    ),
                              const SizedBox(height: 10),
                              Text(
                                '以下のGmail宛にご依頼ください。',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
                              ),
                              Text(
                                '連絡先メールアドレス：coatelier589@gmail.com',
                                style: TextStyle(
                                    fontSize: deviceWidth > 400
                                        ? deviceWidth > 800
                                            ? 18
                                            : 14
                                        : 10),
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
