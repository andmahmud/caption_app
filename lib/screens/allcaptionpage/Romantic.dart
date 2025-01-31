import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Romantic extends StatelessWidget {
  final List<String> romanticCaptions = [
    "You are my today and all of my tomorrows. তুমি আমার আজ এবং আমার সব আগামীকাল।",
    "In your smile, I see something more beautiful than the stars. তোমার হাসিতে আমি তারা থেকে অনেক সুন্দর কিছু দেখি।",
    "I need you like a heart needs a beat. আমাকে তোমার প্রয়োজন ঠিক যেমন একটি হৃদয়কে একটি স্পন্দন প্রয়োজন।",
    "Love is not about how many days, months, or years you have been together. Love is about how much you love each other every single day. ভালোবাসা হল কতদিন, মাস বা বছর একসাথে ছিলে তার বিষয়ে নয়। ভালোবাসা হল প্রতি একদিনে আপনি একে অপরকে কতটা ভালোবাসেন।",
    "I am yours, don't give myself back to me. আমি তোমার, আমাকে নিজের কাছে ফিরিয়ে নিও না।",
    "Every love story is beautiful, but ours is my favorite. প্রতিটি প্রেমের গল্পই সুন্দর, কিন্তু আমাদের গল্পটি আমার প্রিয়।",
    "You are the peanut butter to my jelly. তুমি আমার জেলির জন্য পিনাট বাটার।",
    "I fell in love with you because of all the little things you do. আমি তোমার প্রতি প্রেমে পড়েছি কারণ তুমি যে ছোট ছোট কাজগুলি করো তার জন্য।",
    "When I saw you, I fell in love, and you smiled because you knew. যখন আমি তোমাকে দেখলাম, আমি প্রেমে পড়লাম, এবং তুমি হাসলে কারণ তুমি জানো।",
    "I want to be your favorite hello and your hardest goodbye. আমি তোমার প্রিয় হ্যালো এবং সবচেয়ে কঠিন বিদায় হতে চাই।",
  ];

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Romantic Captions')),
        backgroundColor: Colors.pink, // Romantic and warm color
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: romanticCaptions.length,
            itemBuilder: (context, index) {
              String caption = romanticCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.pinkAccent, // Romantic and soft card color
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        caption,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Copy Button
                          IconButton(
                            icon: const Icon(Icons.copy, color: Colors.black),
                            onPressed: () {
                              copyToClipboard(context, caption);
                            },
                          ), // share Button
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.black),
                            onPressed: () {
                              copyToClipboard(context, caption);
                            },
                          ),
                          // Favorite Icon
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.black,
                            ),
                            onPressed: () {
                              if (isFavorite) {
                                favoritesModel.removeFavorite(caption);
                              } else {
                                favoritesModel.addFavorite(caption);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
