import 'package:caption/screens/funnyCaptionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/sigma.dart';
import 'screens/favorites_screen.dart';
import 'screens/sad_captions_screen.dart';
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
        '/favorites': (context) => FavoritesScreen(),
        '/sad_captions': (context) => SadCaptionsScreen(), 
        '/funny_captions': (context) => funnyCaptionsScreen(), 
      },
    );
  }
}
