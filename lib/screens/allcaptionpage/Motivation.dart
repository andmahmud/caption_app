import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Motivation extends StatelessWidget {
  final List<String> motivationCaptions = [
    "The harder you work for something, the greater you'll feel when you achieve it. আপনি যা কিছু জন্য কঠোর পরিশ্রম করেন, তা অর্জন করার পর আপনি যেটি অনুভব করবেন তা আরও মহান হবে।",
    "Dream it. Wish it. Do it. এটি স্বপ্ন দেখুন। এটি কামনা করুন। এটি করুন।",
    "Success doesn’t just find you. You have to go out and get it. সফলতা কেবল আপনাকে খুঁজে পায় না। আপনাকে বাইরে গিয়ে এটি পেতে হবে।",
    "The key to success is to focus on goals, not obstacles. সফলতার মূল চাবি হল লক্ষ্যগুলিতে মনোযোগ দেওয়া, প্রতিবন্ধকতাগুলিতে নয়।",
    "It always seems impossible until it’s done. এটি সবসময় অসম্ভাব্য মনে হয় যতক্ষণ না এটি সম্পন্ন হয়।",
    "Don’t stop when you’re tired. Stop when you’re done. যখন আপনি ক্লান্ত হন তখন থামবেন না। যখন আপনি শেষ করবেন তখন থামুন।",
    "Wake up with determination. Go to bed with satisfaction. দৃঢ় সংকল্পের সঙ্গে উঠে আসুন। সন্তুষ্টি নিয়ে শোয়া যান।",
    "Believe you can and you're halfway there. বিশ্বাস করুন আপনি করতে পারেন এবং আপনি সেখানেই অর্ধেক পৌঁছেছেন।",
    "The future belongs to those who believe in the beauty of their dreams. ভবিষ্যৎ তাদের যারা তাদের স্বপ্নের সৌন্দর্যে বিশ্বাস করে তাদের belongs।",
    "Don't watch the clock; do what it does. Keep going. ঘড়ি দেখবেন না; এটি যা করে তা করুন। চলতে থাকুন।",
  ];

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Motivational Captions')),
        backgroundColor: Colors.green, // Motivational and fresh color
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: motivationCaptions.length,
            itemBuilder: (context, index) {
              String caption = motivationCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color:
                    Colors.lightGreenAccent, // Fresh and inspiring card color
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
