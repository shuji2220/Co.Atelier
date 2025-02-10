import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactFormPage extends StatefulWidget {
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  // フォーム送信処理
  Future<void> sendEmail() async {
    // Determine the base URL and set the appropriate endpoint
    final baseUrl = Uri.base.toString();
    final url = Uri.parse(
      baseUrl.contains('www.commonality-atelier.com')
          ? 'https://www.commonality-atelier.com/send_email.php'
          : 'https://commonality-atelier.com/send_email.php',
    ); // PHPスクリプトのURL

    // POSTリクエストを送信
    final response = await http.post(url, body: {
      'name': _nameController.text,
      'email': _emailController.text,
      'message': _messageController.text,
    });

    if (response.statusCode == 200) {
      // メール送信成功
      print('Email sent');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('メールが送信されました')));
    } else {
      // エラー処理
      print('Failed to send email');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('メール送信に失敗しました')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('問い合わせフォーム')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'お名前'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'メールアドレス'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'メッセージ'),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendEmail,
              child: Text('送信'),
            ),
          ],
        ),
      ),
    );
  }
}
