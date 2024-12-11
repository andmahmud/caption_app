import 'package:caption/Motivation.dart';
import 'package:caption/screens/Birthday.dart';
import 'package:caption/screens/Friendship.dart';
import 'package:caption/screens/Life.dart';
import 'package:caption/screens/RomLove_Failureantic.dart';
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
      child: SigmaCaptionApp(),
    ),
  );
}




class SigmaCaptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sigma Captions',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  HomeScreen(),
        '/captions': (context) => sigma(),
        '/favorites': (context) => Favorites(),
        '/sad_captions': (context) => Sad(), 
        '/funny_captions': (context) => funny(), 
        '/motivational_captions':(context)=>Motivation(),
        '/life_captions':(context)=>Life(),
        '/romantic_captions':(context)=>Romantic(),
       '/friendship_captions':(context)=>Friendship(),
        '/birthday_captions':(context)=>Birthday(),
        '/love_failure_captions':(context)=>RomLove_Failureantic(),
      },
    );
  }
}
