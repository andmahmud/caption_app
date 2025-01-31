import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Funny extends StatelessWidget {
  final List<String> funnyCaptions = [
    "I'm not lazy, I'm just on energy-saving mode. আমি অলস না, আমি শুধু শক্তি সঞ্চয় মোডে আছি।",
    "Life's too short to be serious all the time. জীবনের সব সময় সিরিয়াস হওয়ার জন্য খুব ছোট।",
    "I'm on a seafood diet. I see food, and I eat it! আমি একটি সীফুড ডায়েটে আছি। আমি খাবার দেখি, এবং আমি এটি খাই!",
    "I woke up like this... tired! আমি এমনই জেগে উঠি... ক্লান্ত!",
    "Why fall in love when you can fall asleep? প্রেমে পড়ার পরিবর্তে কেন ঘুমাতে যাবে?",
    "If we shouldn’t eat at night, why is there a light in the fridge? যদি রাতে না খাওয়া উচিত হয়, তবে ফ্রিজে আলো কেন আছে?",
    "When nothing goes right, go left. যখন কিছুই ঠিকঠাক হয় না, তখন বামে যাও।",
    "Reality called, so I hung up. বাস্তবতা কল করল, তাই আমি তা কেটে দিলাম।",
    "Some people graduate with honors, I am just honored to graduate. কিছু মানুষ সম্মানের সাথে স্নাতক হয়, আমি শুধু স্নাতক করার জন্য সম্মানিত।",
    "Don't worry if plan A fails, there are 25 more letters in the alphabet. যদি প্ল্যান এ ব্যর্থ হয়, তবে বর্ণমালায় আরও ২৫টি অক্ষর আছে।",
  ];

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Funny Captions')),
        backgroundColor: Colors.teal, // Fun and bright color
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: funnyCaptions.length,
            itemBuilder: (context, index) {
              String caption = funnyCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.yellowAccent, // Cheerful card color
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
