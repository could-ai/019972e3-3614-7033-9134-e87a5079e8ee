import 'package:flutter/material.dart';
import 'package:couldai_user_app/story_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terra\'s Legacy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey[900],
        scaffoldBackgroundColor: Colors.blueGrey[900],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[800],
          elevation: 0,
        ),
        cardColor: Colors.blueGrey[800],
      ),
      home: const StoryScreen(),
    );
  }
}
