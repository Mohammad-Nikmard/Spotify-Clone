import 'package:flutter/material.dart';
import 'package:spotify_clone/ui/profile_screen.dart';
import 'package:spotify_clone/ui/scan_spotify_code.dart';
import 'package:spotify_clone/ui/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScanSpotifyCodeScreen(),
    );
  }
}
