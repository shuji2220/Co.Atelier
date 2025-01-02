import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Page'),
      ),
      body: Center(
        child: Text('This is the offer page'),
      ),
    );
  }
}
