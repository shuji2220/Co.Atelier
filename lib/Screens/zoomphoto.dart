import 'package:flutter/material.dart';

class ZoomPhoto extends StatelessWidget {
  final String photoPath;

  const ZoomPhoto({super.key, required this.photoPath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Flexible(
            child: Center(
              child: Image.asset(photoPath),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
