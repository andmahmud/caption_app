import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Success extends StatelessWidget {
  final List<String> friendshipCaptions = [
    "A true friend is somebody who can make us feel better no matter how bad things may be. একজন প্রকৃত বন্ধু হলো কেউ যে আমাদের যেকোনো পরিস্থিতিতেও ভালো অনুভব করাতে পারে।",
    "Friendship is born at that moment when one person says to another, 'What! You too? I thought I was the only one.' বন্ধুত্ব তখনই জন্ম নেয় যখন একজন ব্যক্তি অন্যকে বলে, 'কি! তুমি ও? আমি ভাবছিলাম আমি একাই ছিলাম।'",
    "Friends are the family we choose for ourselves. বন্ধুরা হলো সেই পরিবার, যা আমরা নিজেদের জন্য বেছে নেই।",
    "A friend is someone who knows all about you and still loves you. একজন বন্ধু হলো সেই ব্যক্তি, যে তোমার সব কিছু জানে এবং তারপরও তোমাকে ভালোবাসে।",
    "Friendship is not about whom you have known the longest, it’s about who came and never left. বন্ধুত্ব হলো সেই সম্পর্ক, যার মধ্যে দীর্ঘ সময় নয়, বরং সেই বন্ধু, যে এসেছিল এবং কখনো চলে যায়নি।",
    "A friend to all is a friend to none. যে সবার বন্ধু, সে কারোরই বন্ধু নয়।",
    "True friends stab you in the front. প্রকৃত বন্ধু তোমাকে পিছনে নয়, সামনে আঘাত করে।",
    "Good friends are like stars. You don’t always see them, but you know they’re always there. ভালো বন্ধু তারা তারা নক্ষত্রের মতো। তুমি তাদের সবসময় দেখতে পাবে না, কিন্তু তুমি জানো তারা সবসময় সেখানে থাকে।",
    "Friendship is a single soul dwelling in two bodies. বন্ধুত্ব হলো এক আত্মা দুটি দেহে বিরাজমান।",
    "There are no strangers here; Only friends you haven’t yet met. এখানে কোনো অপরিচিত ব্যক্তি নেই; কেবলমাত্র বন্ধুরা যারা তুমি এখনও দেখনি।",
  ];

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Success Captions')),
        backgroundColor:
            Colors.orange, // Warm and inviting color for friendship
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: friendshipCaptions.length,
            itemBuilder: (context, index) {
              String caption = friendshipCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.yellowAccent, // Cheerful color for friendship
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
                          ),
                          // Share Button
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.black),
                            onPressed: () {},
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
