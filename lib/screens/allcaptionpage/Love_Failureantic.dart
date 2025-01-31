import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Love_Failureantic extends StatelessWidget {
  final List<String> loveFailureCaptions = [
    "Sometimes, love just isn’t enough. কখনও কখনও, ভালোবাসা যথেষ্ট নয়।",
    "I gave you my heart, but you broke it. আমি তোমাকে আমার হৃদয় দিলাম, কিন্তু তুমি এটিকে ভেঙে দিলে।",
    "The hardest part about loving someone is saying goodbye. কাউকে ভালোবাসার সবচেয়ে কঠিন অংশ হল বিদায় বলা।",
    "Love is not always about happy endings. Sometimes it’s about learning to move on. ভালোবাসা সবসময় সুখী সমাপ্তি নিয়ে নয়। কখনও কখনও এটি হলো এগিয়ে যাওয়ার শিখতে হওয়া।",
    "The pain of love failure is real, but so is the hope for new beginnings. ভালোবাসার ব্যথা বাস্তব, কিন্তু নতুন শুরুর জন্য আশাও বাস্তব।",
    "The best way to heal a broken heart is to give it time. একটি ভাঙা হৃদয় সুস্থ করার সবচেয়ে ভাল উপায় হল সময় দেওয়া।",
    "Sometimes, we need to let go of someone who doesn’t value us. কখনও কখনও, আমাদের এমন কাউকে ছেড়ে দিতে হয় যে আমাদের মূল্য দেয় না।",
    "You were my everything, and now you’re just a memory. তুমি ছিলে আমার সবকিছু, আর এখন তুমি শুধু একটি স্মৃতি।",
    "Love failure doesn’t mean the end; it means there is room for a better love. ভালোবাসার ব্যর্থতা মানে শেষ নয়; এর মানে হল যে আরও ভালো ভালোবাসার জন্য জায়গা আছে।",
    "I thought you were my forever, but forever wasn’t meant for us. আমি ভেবেছিলাম তুমি আমার চিরকাল ছিলে, কিন্তু চিরকাল আমাদের জন্য ছিল না।",
    "It’s better to be alone than to be with someone who doesn’t appreciate you. তোমার মূল্য না জানানো এমন কাউকে সঙ্গে থাকা থেকে একা থাকা অনেক ভালো।",
    "I lost you, but I gained a lesson. আমি তোমাকে হারিয়েছি, কিন্তু আমি একটি শিক্ষা পেয়েছি।",
    "Maybe I loved you too much, but that doesn’t make you any less wrong. হয়তো আমি তোমাকে বেশি ভালোবাসলাম, কিন্তু তা তোমাকে কম ভুল বানায় না।",
    "Letting go is hard, but holding on to something that’s broken is harder. ছেড়ে দেওয়া কঠিন, কিন্তু যা ভাঙা তা ধরে রাখা আরও কঠিন।",
    "When love fails, the heart learns to grow stronger. যখন ভালোবাসা ব্যর্থ হয়, হৃদয় আরও শক্তিশালী হতে শিখে।",
    "You can’t force someone to love you, no matter how hard you try. তুমি কাউকে ভালোবাসতে জোর করতে পার না, যতই কঠিন চেষ্টা করো না কেন।",
    "The hardest goodbye is the one you never saw coming. সবচেয়ে কঠিন বিদায় হল সেই বিদায় যা তুমি কখনও আসতে দেখোনি।",
    "In love, you either win or you learn. But you never lose. ভালোবাসায়, তুমি হয় জিতো বা শিখো। কিন্তু কখনো হারো না।",
    "Sometimes the one who loves you the most is the one who has to walk away. কখনও কখনও, যে তোমাকে সবচেয়ে বেশি ভালোবাসে, সে সেই ব্যক্তি যেটি চলে যেতে হয়।",
    "Love failure feels like your world has collapsed, but it doesn’t define you. ভালোবাসার ব্যর্থতা এমন মনে হয় যে তোমার পৃথিবী ধ্বংস হয়ে গেছে, কিন্তু এটি তোমাকে সংজ্ঞায়িত করে না।",
    "Letting go doesn’t mean you stopped caring, it just means you stopped trying to force it. ছেড়ে দেওয়া মানে এই নয় যে তুমি আর যত্ন নিচ্ছো, এর মানে হল যে তুমি এটিকে জোর করে না চালানোর চেষ্টা করেছো।",
    "Every heartbreak teaches us something valuable. প্রতিটি হৃদয়ভাঙ্গন আমাদের কিছু মূল্যবান শেখায়।",
    "Sometimes the heart needs more time to accept what the mind already knows. কখনও কখনও হৃদয়ের প্রয়োজন আরও সময়, যা মন ইতিমধ্যে জানে তা গ্রহণ করার জন্য।",
    "Love failure is like a bad dream, but it’s over once you wake up. ভালোবাসার ব্যর্থতা একটি খারাপ স্বপ্নের মতো, কিন্তু একবার তুমি জেগে উঠলে এটি শেষ হয়ে যায়।",
    "When love fades, the heart learns to heal. যখন ভালোবাসা মলিন হয়ে যায়, হৃদয় শিখে সুস্থ হতে।",
    "I will never forget you, but I’ll learn to live without you. আমি কখনো তোমাকে ভুলব না, কিন্তু আমি তোমাকে ছাড়া বাঁচতে শিখব।",
    "Love doesn’t always work out, but it doesn’t mean you should stop believing in it. ভালোবাসা সবসময় কাজ করে না, কিন্তু এর মানে এই নয় যে তুমি এটিতে বিশ্বাস করা বন্ধ করতে হবে।",
    "Some chapters in life are meant to be closed, but that doesn’t mean the story is over. জীবনের কিছু অধ্যায় বন্ধ করা উচিত, কিন্তু এর মানে এই নয় যে গল্পটি শেষ হয়েছে।",
    "Love is a beautiful thing, but sometimes it brings pain instead of happiness. ভালোবাসা একটি সুন্দর জিনিস, কিন্তু কখনও কখনও এটি সুখের পরিবর্তে ব্যথা নিয়ে আসে।",
    "The end of one love story means the beginning of a new one. একটিকে ভালোবাসার গল্পের সমাপ্তি মানে একটি নতুন গল্পের শুরু।",
    "Falling out of love is hard, but sometimes it’s necessary to move forward. ভালোবাসা থেকে পড়ে যাওয়া কঠিন, কিন্তু কখনও কখনও এটি এগিয়ে যাওয়ার জন্য প্রয়োজনীয়।",
    "Heartbreaks may leave scars, but they also make us stronger. হৃদয়ভাঙ্গন চিহ্ন রেখে যেতে পারে, কিন্তু তারা আমাদের আরও শক্তিশালী করে।",
    "True love will never fail, but sometimes, we fail to see it. প্রকৃত ভালোবাসা কখনও ব্যর্থ হবে না, কিন্তু কখনও কখনও, আমরা এটি দেখতে ব্যর্থ হই।",
    "In love, sometimes you have to let go to let yourself grow. ভালোবাসায়, কখনও কখনও তুমি ছেড়ে দিতে হয় যেন তুমি নিজেকে বেড়ে উঠতে দিতে পারো।",
    "Love failure doesn’t mean you can’t love again. It just means you’re learning to love yourself first. ভালোবাসার ব্যর্থতা মানে এই নয় যে তুমি আবার ভালোবাসতে পারবে না। এর মানে হল যে তুমি প্রথমে নিজেকে ভালোবাসতে শিখছো।",
    "Every failure teaches you how to become a better lover. প্রতিটি ব্যর্থতা তোমাকে আরও ভালো প্রেমিক হতে শেখায়।",
    "Life goes on even after love fails. জীবন চলে যায়, ভালোবাসা ব্যর্থ হওয়ার পরেও।",
    "Love failure feels like a deep cut, but eventually, it heals. ভালোবাসার ব্যর্থতা একটি গভীর কাটার মতো অনুভব হয়, কিন্তু অবশেষে, এটি সুস্থ হয়ে যায়।",
    "Don’t let love failure define who you are. Let it be the reason for your growth. ভালোবাসার ব্যর্থতাকে তোমার পরিচয় নির্ধারণ করতে দিও না। এটিকে তোমার বৃদ্ধির কারণ হতে দাও।",
    "Sometimes you need to fall in love with yourself before you can fall in love with someone else. কখনও কখনও, তোমাকে অন্য কাউকে ভালোবাসার আগে নিজেকে ভালোবাসতে শিখতে হবে।",
    "A love failure is not the end; it’s a new beginning. একটি ভালোবাসার ব্যর্থতা শেষ নয়; এটি একটি নতুন শুরু।",
    "Love failure teaches us resilience. ভালোবাসার ব্যর্থতা আমাদের স্থিতিস্থাপকতা শেখায়।",
    "No one can take away your power to love. কেউ তোমার ভালোবাসার শক্তি কেড়ে নিতে পারে না।",
    "It’s better to be hurt by the truth than to be comforted with a lie. সত্য দ্বারা আঘাত পাওয়া মিথ্যার সাথে সান্ত্বনা পাওয়ার চেয়ে অনেক ভালো।",
    "You don’t need someone to complete you; you need someone to accept you completely. তোমাকে পূর্ণ করার জন্য কাউকে প্রয়োজন নেই; তোমাকে সম্পূর্ণভাবে গ্রহণ করার জন্য কাউকে প্রয়োজন।",
    "Love failure doesn’t make you weak; it makes you stronger. ভালোবাসার ব্যর্থতা তোমাকে দুর্বল করে না; এটি তোমাকে আরও শক্তিশালী করে।",
    "The more you love, the more you grow. তুমি যত বেশি ভালোবাসবে, তত বেশি তুমি বেড়ে উঠবে।",
    "Heartbreak is the price we pay for love. হৃদয়ভাঙ্গন হল ভালোবাসার জন্য আমরা যা মূল্য পরিশোধ করি।",
    "Sometimes love doesn’t work out, but that’s okay because we learn to love ourselves. কখনও কখনও ভালোবাসা কাজ করে না, কিন্তু সমস্যা নেই কারণ আমরা নিজেকে ভালোবাসতে শিখি।",
    "Love is a journey, not a destination. ভালোবাসা একটি যাত্রা, একটি গন্তব্য নয়।",
    "The right person will come into your life when you’re ready. সঠিক ব্যক্তি তোমার জীবনে আসবে যখন তুমি প্রস্তুত হবে।",
    "Love failure is just a chapter in your life; it’s not the entire book. ভালোবাসার ব্যর্থতা তোমার জীবনের একটি অধ্যায়; এটি পুরো বই নয়।",
    "Life is tough, but so are you. জীবন কঠিন, কিন্তু তেমনই তুমি।",
    "Don’t cry over someone who doesn’t deserve your tears. সেই ব্যক্তির জন্য কাঁদবেন না যে তোমার অশ্রু প্রাপ্য নয়।",
    "When one love fails, another love will find its way to you. যখন একটি ভালোবাসা ব্যর্থ হয়, অন্য একটি ভালোবাসা তোমার পথ পাবে।",
    "You are stronger than you think, and you will love again. তুমি তোমার চেয়ে শক্তিশালী, এবং তুমি আবার ভালোবাসবে।",
    "Love failure is just a reminder that you deserve better. ভালোবাসার ব্যর্থতা শুধু একটি স্মরণ যে তুমি আরও ভালো প্রাপ্য।",
  ];

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Breakup Captions')),
        backgroundColor: Colors.teal, // Custom AppBar color
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: loveFailureCaptions.length,
            itemBuilder: (context, index) {
              String caption = loveFailureCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.pinkAccent, // Custom Card color
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
