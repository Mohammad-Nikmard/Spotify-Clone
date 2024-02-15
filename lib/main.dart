import 'package:flutter/material.dart';
import 'package:spotify_clone/ui/choose_artist_screen.dart';
import 'package:spotify_clone/ui/create_email_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateEmailScreen(),
    );
  }
}
