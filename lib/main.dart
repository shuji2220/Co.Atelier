import "package:flutter/material.dart";
import "package:modelhp/Screens/toppage.dart";
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Co.Atelier',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.zenAntiqueTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Homepage(),
      ),
    );
  }
}
