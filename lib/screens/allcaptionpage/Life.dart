import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Life extends StatelessWidget {
  final List<String> lifeCaptions = [
    "Life is 10% what happens to us and 90% how we react to it. জীবন হল ১০% যা আমাদের সঙ্গে ঘটে এবং ৯০% কীভাবে আমরা এতে প্রতিক্রিয়া জানাই।",
    "Live life as if everything is rigged in your favor. জীবন এমনভাবে বসবাস করুন যেন সব কিছু আপনার পক্ষে সাজানো হয়েছে।",
    "The purpose of life is not to be happy. It is to be useful, to be honorable, to be compassionate, to have it make some difference that you have lived and lived well. জীবনের উদ্দেশ্য সুখী হওয়া নয়। এটি হল উপকারী হওয়া, সম্মানজনক হওয়া, সহানুভূতিশীল হওয়া, এমন একটি পার্থক্য তৈরি করা যা আপনি বেঁচে আছেন এবং ভালভাবে বেঁচে আছেন।",
    "In the end, it's not the years in your life that count, it's the life in your years. শেষমেশ, এটা আপনার জীবনের বছরগুলি নয় যা গন্য হয়, এটা আপনার বছরগুলির মধ্যে জীবন।",
    "The best way to predict your future is to create it. আপনার ভবিষ্যত ভবিষ্যদ্বাণী করার সেরা উপায় হল এটি তৈরি করা।",
    "Your time is limited, so don't waste it living someone else's life. আপনার সময় সীমিত, তাই এটি অন্যদের জীবন বেঁচে থাকতে অপচয় করবেন না।",
    "Life is either a daring adventure or nothing at all. জীবন হল একটি সাহসী অভিযান বা কিছুই নয়।",
    "Don't wait. The time will never be just right. অপেক্ষা করবেন না। সময় কখনো সঠিক হবে না।",
    "Life isn't about waiting for the storm to pass. It's about learning to dance in the rain. জীবন হলো ঝড় পার হওয়ার জন্য অপেক্ষা করা নয়। এটি বৃষ্টির মধ্যে নাচতে শেখা।",
    "To live is the rarest thing in the world. Most people exist, that is all. বেঁচে থাকা হল পৃথিবীতে সবচেয়ে বিরল জিনিস। বেশিরভাগ মানুষ শুধুমাত্র অস্তিত্ব রয়েছে, এতটুকুই।",
  ];

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Life Captions')),
        backgroundColor: Colors.blue, // Calm and reflective color
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: lifeCaptions.length,
            itemBuilder: (context, index) {
              String caption = lifeCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.lightBlueAccent, // Calm and serene card color
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
                          // share Button
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
