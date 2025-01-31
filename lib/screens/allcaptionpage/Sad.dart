import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_model.dart';

class Sad extends StatelessWidget {
  final List<String> sadCaptions = [
    // English Captions
    "Tears speak the words that the heart can't say.",
    "It's hard to forget someone who gave you so much to remember.",
    "Pain changes people; it makes them trust less and think more.",
    "Sometimes, it's better to be alone than to be hurt again.",
    "Behind my smile is a broken heart.",
    // Bangla Captions
    "চোখের জল বলে দেয় যা হৃদয় বলতে পারে না।",
    "যাকে ভুলতে চাও, সে-ই স্মৃতিতে সবচেয়ে বেশি থাকে।",
    "বেদনাই মানুষকে বদলে দেয়; বেশি ভাবতে শেখায়।",
    "কখনও কখনও, একা থাকা ভালো, যাতে আর কষ্ট না পেতে হয়।",
    "আমার হাসির পেছনে লুকানো একটি ভাঙা হৃদয়।",
    // More English Captions
    "Every heart has a pain; only the way of expression is different.",
    "The worst kind of pain is when you’re smiling just to stop the tears.",
    "Sometimes, memories sneak out of my eyes and roll down my cheeks.",
    "Crying doesn’t mean you’re weak; it means you’ve been strong for too long.",
    "My silence is just another word for my pain.",
    // More Bangla Captions
    "প্রত্যেক হৃদয়েরই একটি ব্যথা থাকে; শুধু প্রকাশের উপায় ভিন্ন।",
    "সবচেয়ে খারাপ ব্যথা হল যখন আপনি কাঁদা থামানোর জন্য হাসছেন।",
    "মাঝে মাঝে স্মৃতিগুলো চোখ দিয়ে গড়িয়ে পড়ে।",
    "কাঁদা মানে দুর্বল হওয়া নয়; বরং অনেক দিন ধরে শক্ত থাকার চিহ্ন।",
    "আমার নীরবতা আমার যন্ত্রণার আরেকটি শব্দ।",
    "Tears speak the words that the heart can't say.",
    "It's hard to forget someone who gave you so much to remember.",
    "Pain changes people; it makes them trust less and think more.",
    "Sometimes, it's better to be alone than to be hurt again.",
    "Behind my smile is a broken heart.",
    "Every heart has a pain; only the way of expression is different.",
    "The worst kind of pain is when you’re smiling just to stop the tears.",
    "Sometimes, memories sneak out of my eyes and roll down my cheeks.",
    "Crying doesn’t mean you’re weak; it means you’ve been strong for too long.",
    "My silence is just another word for my pain.",
    "Hiding my feelings has become a part of my life.",
    "I’m not okay, but I smile anyway.",
    "Sometimes, you just need to cry it out.",
    "My biggest mistake is thinking that people care for me as much as I care for them.",
    "It's sad when someone you know becomes someone you knew.",
    "I'm slowly giving up.",
    "Depression is being colorblind and constantly told how colorful the world is.",
    "I smile, but deep inside, I feel empty.",
    "People don't always need advice; sometimes, they just need someone to listen.",
    "Sadness flies away on the wings of time.",
    "I’m tired of trying, crying, and not being enough.",
    "The saddest part of life is saying goodbye to someone you wish to spend your life with.",
    "I hide my tears when I say your name, but the pain in my heart is still the same.",
    "My heart aches for the things I cannot have.",
    "Sometimes, you just have to pretend you're happy.",
    "The worst feeling isn’t being lonely; it’s being forgotten by someone you can’t forget.",
    "Why does love come with so much pain?",
    "I miss the person I was before I met you.",
    "The scars you can’t see are the hardest to heal.",
    "I’m drowning in the sea of my tears.",
    "It’s hard to move on when memories keep pulling you back.",
    "The only thing worse than being hurt is pretending that you’re not.",
    "Every tear is a sign of brokenness inside.",
    "I’m lost in the maze of my emotions.",
    "I wish I could go back to the days when everything was okay.",
    "The pain never really goes away; you just learn to live with it.",
    "I’m not angry; I’m just hurt.",
    "Sadness is the price we pay for caring too much.",
    "Sometimes, you don’t realize the value of a moment until it becomes a memory.",
    "I gave you my heart, but all you did was break it.",
    "The hardest part about moving on is accepting that the other person already has.",
    "I wish I could erase all the memories I have of you.",
    "It’s better to feel pain than to feel nothing at all.",
    "Broken hearts can’t be fixed with words.",
    "The saddest part of love is not being able to love freely.",
    "I’m holding on to something that’s already gone.",
    "I wish I could turn back time and make things right.",
    "No one notices your sadness until it turns into anger.",
    "I’m stuck in a moment that I can’t get out of.",
    "Sometimes, the person you’d take a bullet for ends up being the one behind the trigger.",
    "Loneliness is my constant companion.",
    "I keep everything inside because I don’t want to burden others.",
    "I don’t know what hurts more: the pain of losing you or the pain of pretending I’m okay.",
    "The deeper the love, the deeper the pain.",
    "I’m not strong enough to face the world alone.",
    "Broken dreams leave scars on the soul.",
    "I’m trying to find happiness in a world that’s full of pain.",
    "The hardest thing I’ve ever had to do is walk away from someone I love.",
    "I feel like I’m fading away.",
    "Sadness is like a shadow that never leaves.",
    "I’m tired of being the one who always cares more.",
    "The hardest part about being strong is that no one asks if you’re okay.",
    "The only thing worse than missing you is pretending I don’t.",
    "I’ve been hurt so many times that I’m afraid to love again.",
    "Even in a crowd, I feel alone.",
    "I wish I could make you feel the pain you’ve caused me.",
    "I’m not afraid of being alone; I’m afraid of being forgotten.",
    "It’s hard to explain how much I miss you.",
    "The saddest people smile the brightest.",
    "I’m tired of holding back my tears.",
    "Sometimes, the hardest thing to do is nothing at all.",
    "I don’t know how to heal this pain.",
    "I’m tired of pretending to be okay when I’m not.",
    "You broke me, but I still love you.",
    "I’m not who I used to be because of the pain you caused me.",
    "The pain of losing you will never go away.",
    "I’ve learned to hide my pain behind a smile.",
    "I miss the old me, the happy me.",
    "I’m stuck in a cycle of sadness and pain.",
    "Every tear I shed is for you.",
    "I wish I could forget you as easily as you forgot me.",
    "The pain of love is worse than any other pain.",
    "I’m tired of fighting a battle I can’t win.",
    "The more I try to move on, the more I think of you.",
    "I’m not sure if I’m healing or just used to the pain.",
    "Even the happiest memories can bring tears to my eyes.",
    "I’ve given up on trying to be happy.",
    "Sadness is a part of my life that I can’t escape.",
    "The only thing I feel is emptiness inside.",
    "I’ve lost myself in the pain of losing you.",
    "I’m not okay, and I don’t know if I ever will be.",
    "I wish I could erase all the pain and start over.",
  ];

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sad Captions')),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          return ListView.builder(
            itemCount: sadCaptions.length,
            itemBuilder: (context, index) {
              String caption = sadCaptions[index];
              bool isFavorite = favoritesModel.favorites.contains(caption);

              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.teal, // Romantic and soft card color
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
                              color: isFavorite ? Colors.pink : Colors.black,
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
