import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Birthday extends StatelessWidget {
  final List<String> birthdayCaptions = [
    "Age is merely the number of years the world has been enjoying you. Cheers to you and your life! জন্মদিনের শুভেচ্ছা, আপনার জন্য একটি দুর্দান্ত বছর হতে চলেছে!",
    "Count your life by smiles, not tears. Count your age by friends, not years. জীবনটি হাসির মাধ্যমে গণনা করুন, অশ্রু দিয়ে নয়। বন্ধুর দ্বারা আপনার বয়স গণনা করুন, বছর দ্বারা নয়।",
    "Happy Birthday! May your special day be full of love, happiness, and joy. শুভ জন্মদিন! আপনার বিশেষ দিনটি প্রেম, সুখ এবং আনন্দে পূর্ণ হোক।",
    "Wishing you a birthday as special as you are! আপনি যেমন বিশেষ, তেমন একটি জন্মদিন কামনা করছি!",
    "May you live as long as you want, and never want as long as you live. আপনি যতদিন চাও ততদিন বাঁচুন, এবং যতদিন বাঁচবেন ততদিন কিছুই চাওয়ার প্রয়োজন নেই।",
    "Happy Birthday to someone who lights up every room they enter. শুভ জন্মদিন সেই ব্যক্তির জন্য যারা প্রতিটি কক্ষে আলোকিত করেন।",
    "Here's to another year of making memories with you. আপনার সাথে আরও একটি বছর স্মৃতি তৈরি করার জন্য! শুভ জন্মদিন!",
    "Wishing you a day filled with love, laughter, and joy! আপনার দিনটি প্রেম, হাসি এবং আনন্দে পূর্ণ হোক!",
    "On your birthday, I wish you much happiness, success, and joy. Happy birthday! আপনার জন্মদিনে আমি আপনাকে অনেক সুখ, সফলতা এবং আনন্দ কামনা করি। শুভ জন্মদিন!",
    "May this year bring new happiness, new goals, new achievements, and a lot of new inspirations in your life. শুভ জন্মদিন! এই বছরটি আপনার জীবনে নতুন সুখ, নতুন লক্ষ্য, নতুন অর্জন এবং প্রচুর নতুন অনুপ্রেরণা নিয়ে আসুক।",
    // Add more captions to make a total of 100...
    "Another year older, another year wiser! Happy birthday!",
    "Life is too short to be anything but happy. Have a fantastic birthday!",
    "On your birthday, I just want to remind you that you're amazing.",
    "May your birthday be the start of a year filled with happiness, good health, and success!",
    "Wishing you an extra special birthday filled with laughter, love, and great memories!",
    "Another year has passed, and you just keep getting better! Happy Birthday!",
    "You deserve all the happiness in the world. Enjoy your special day!",
    "To the one who makes life brighter, happy birthday!",
    "Here's to a year filled with laughter, joy, and love. Happy Birthday!",
    "Wishing you an unforgettable day filled with all your favorite things. Happy Birthday!",
    "May your birthday be as incredible as you are!",
    "Happy Birthday! I hope all your dreams come true this year!",
    "May this birthday be the start of a year filled with happiness and joy.",
    "Enjoy every moment of your birthday celebration! You deserve the best.",
    "Here's to another year of making memories together! Happy Birthday!",
    "Wishing you all the best on your special day. Enjoy it to the fullest!",
    "May this year be your best one yet! Happy Birthday!",
    "On your birthday, I'm sending you good vibes and positive energy. Enjoy!",
    "Hoping your day is filled with as much happiness as you bring to others. Happy Birthday!",
    "Wishing you all the joy in the world on your birthday!",
    "May your birthday be filled with laughter, fun, and everything you love.",
    "Another year to live, love, and laugh. Happy Birthday!",
    "Cheers to you and your life! May this year be full of blessings.",
    "May your birthday be filled with special memories and joy!",
    "On your birthday, may the year ahead bring you nothing but happiness and success.",
    "Wishing you the happiest of birthdays! May your dreams come true.",
    "You’re not just a year older; you’re a year better. Happy Birthday!",
    "Wishing you a year of health, success, and happiness. Happy Birthday!",
    "Here’s to a day that’s as special as you are! Happy Birthday!",
    "May your birthday be the beginning of a year filled with blessings. Enjoy!",
    "Hoping your birthday is as awesome as you are!",
    "Sending you lots of love and happiness on your birthday. Enjoy your day!",
    "Another year, another adventure. Wishing you a wonderful birthday!",
    "May your birthday be the happiest one yet, filled with love, laughter, and joy.",
    "You deserve the best birthday, filled with love and happiness.",
    "Wishing you a fantastic year ahead filled with wonderful surprises!",
    "Happy Birthday to the one who brings joy to everyone they meet!",
    "Another year of making amazing memories. Happy Birthday!",
    "May this birthday bring you endless joy, laughter, and fun!",
    "Cheers to another year of great moments, love, and happiness. Happy Birthday!",
    "May this special day bring you everything you’ve been wishing for. Happy Birthday!",
    "On your birthday, may you receive all the love and joy you give to others!",
    "Wishing you a day as fabulous as you are. Happy Birthday!",
    "To the one who always makes everything better, happy birthday!",
    "May your birthday be filled with love, laughter, and endless joy!",
    "You deserve all the happiness in the world. Have a wonderful birthday!",
    "May your day be as amazing as you are. Happy Birthday!",
    "Wishing you all the best on your birthday and beyond!",
    "May this year be filled with love, laughter, and success. Happy Birthday!",
    "You make every day better just by being you. Have a fantastic birthday!",
    "Happy Birthday! Wishing you love, laughter, and lots of fun.",
    "May your birthday be the start of a year full of great things!",
    "Enjoy your special day to the fullest. Happy Birthday!",
    "Here's to another amazing year ahead. Happy Birthday!",
    "Wishing you all the happiness your heart can hold. Happy Birthday!",
    "May your birthday be filled with sweet memories and endless joy!",
    "To the one who makes life more fun, happy birthday!",
    "Wishing you a birthday as incredible as you are!",
    "Here’s to another year of success, happiness, and love!",
    "You’re a star! Shine bright this year and always. Happy Birthday!",
    "May your day be filled with laughter, love, and cake!",
    "Happy Birthday to someone who deserves all the best things in life!",
    "Sending you all my love on your special day. Happy Birthday!",
    "Here’s to another year of happiness, laughter, and memories!",
    "May your birthday bring you joy and laughter that lasts all year!",
    "Happy Birthday! May you have a year full of blessings and happiness.",
    "Wishing you a fabulous birthday filled with love and laughter.",
    "May your birthday be the best day of the year!",
    "Wishing you all the happiness in the world today and every day!",
    "May this birthday be the start of an incredible year ahead!",
    "You deserve the best birthday ever. Enjoy every moment!",
    "Here's to a fabulous year ahead. Happy Birthday!",
    "May your birthday bring you everything you’ve wished for and more!",
    "Enjoy your special day to the fullest. You deserve it!",
    "Wishing you the happiest birthday ever!",
    "May all your dreams come true today and always. Happy Birthday!",
    "You are loved more than you can imagine. Happy Birthday!",
    "Wishing you a year filled with success, happiness, and good health!",
    "On your birthday, I’m sending you love, joy, and all the good things in life.",
    "May your birthday be filled with laughter, love, and amazing memories.",
    "Happy Birthday! Wishing you a year full of love and happiness.",
    "You make every year better! Happy Birthday!",
    "To the one who makes life better, Happy Birthday!",
    "May this birthday bring you joy, peace, and everything you deserve.",
    "On your special day, I wish you all the happiness in the world. Happy Birthday!",
    "Wishing you a birthday full of smiles, laughter, and great memories.",
    "Happy Birthday! May the year ahead be full of blessings.",
    "May your birthday be the beginning of a year filled with love and joy!",
    "Wishing you a birthday that is as incredible as you are!",
    "Cheers to another year of happiness and success. Happy Birthday!",
    "May your day be as special as you are. Enjoy your birthday!",
    "On your birthday, may you be surrounded by love, laughter, and joy.",
    "Here’s to another year of making memories and enjoying life. Happy Birthday!",
    "Happy Birthday! Enjoy this special day to the fullest!"
  ];

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Birthday Captions')),
        backgroundColor: Colors.pink, // Color to reflect the birthday theme
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: birthdayCaptions.length,
            itemBuilder: (context, index) {
              String caption = birthdayCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.pinkAccent, // Color to reflect a festive theme
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
                          // Copy Button
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
