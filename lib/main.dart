import 'package:caption/screens/Motivation.dart';
import 'package:caption/screens/Birthday.dart';
import 'package:caption/screens/Friendship.dart';
import 'package:caption/screens/Life.dart';
import 'package:caption/screens/Love_Failureantic.dart';
import 'package:caption/screens/Romantic.dart';
import 'package:caption/screens/funny.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/sigma.dart';
import 'screens/Favorites.dart';
import 'screens/Sad.dart';
import 'models/favorites_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesModel(),
      child: const CaptionApp(),
    ),
  );
}

class CaptionApp extends StatelessWidget {
  const CaptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Captions',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/captions': (context) => sigma(),
        '/favorites': (context) => const Favorites(),
        '/sad_captions': (context) => Sad(),
        '/funny_captions': (context) => Funny(),
        '/motivational_captions': (context) => Motivation(),
        '/life_captions': (context) => Life(),
        '/romantic_captions': (context) => Romantic(),
        '/friendship_captions': (context) => Friendship(),
        '/birthday_captions': (context) => Birthday(),
        '/love_failure_captions': (context) => Love_Failureantic(),
      },
    );
  }
}
