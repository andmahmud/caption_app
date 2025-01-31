import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Travel extends StatelessWidget {
  final List<String> travelCaptions = [
    "Travel far enough to meet yourself. নিজেকে খুঁজে পাওয়ার জন্য দূরে ভ্রমণ করো।",
    "Adventure is out there, go find it! রোমাঞ্চ তোমার জন্য অপেক্ষা করছে, তা খুঁজে বের করো!",
    "Wander often, wonder always. বারবার ঘোরো, সবসময় বিস্মিত হও।",
    "Not all those who wander are lost. যারা ঘোরাঘুরি করে, তারা সবাই হারিয়ে যায় না।",
    "The journey is the destination. গন্তব্য নয়, যাত্রাই হলো আসল উদ্দেশ্য।",
    "Travel is the only thing you buy that makes you richer. ভ্রমণই একমাত্র বিনিয়োগ, যা তোমাকে ধনী করে।",
    "Take only memories, leave only footprints. শুধুমাত্র স্মৃতি নাও, পদচিহ্ন রেখে যাও।",
    "Live your life by a compass, not a clock. সময়ের হিসাবে নয়, দিকনির্দেশনা মেনে জীবনকে গড়ে তোলো।",
    "Jobs fill your pocket, but adventures fill your soul. চাকরি তোমার পকেট ভরাবে, কিন্তু রোমাঞ্চ তোমার আত্মাকে পূর্ণ করবে।",
    "Traveling – it leaves you speechless, then turns you into a storyteller. ভ্রমণ তোমাকে প্রথমে নিঃশব্দ করবে, তারপর গল্পকার বানাবে।",
  ];

  Travel({super.key});

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Travel Captions')),
        backgroundColor: Colors.teal, // Travel-themed color
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: travelCaptions.length,
            itemBuilder: (context, index) {
              String caption = travelCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.lightBlueAccent, // Travel-related color
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
