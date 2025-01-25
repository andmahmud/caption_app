import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../models/favorites_model.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  void copyToClipboard(BuildContext context, String caption) {
    Clipboard.setData(ClipboardData(text: caption));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Favorite Captions')),
        backgroundColor: const Color.fromARGB(255, 53, 164, 184),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favoritesModel, child) {
          if (favoritesModel.favorites.isEmpty) {
            return const Center(
              child: Text(
                'No Favorites yet!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            itemCount: favoritesModel.favorites.length,
            itemBuilder: (context, index) {
              String caption = favoritesModel.favorites[index];
              return Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Caption text
                      Text(
                        caption,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                          height: 8.0), // Space between text and icons
                      // Row for icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Copy Button
                          IconButton(
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              copyToClipboard(context, caption);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          // Delete Button
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              favoritesModel.removeFavorite(caption);
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
