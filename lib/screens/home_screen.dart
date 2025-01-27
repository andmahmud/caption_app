import 'package:caption/screens/Drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Center(child: Text("Enjoy the Status")),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard(
                    context,
                    color: Colors.deepPurple,
                    icon: Icons.psychology,
                    label: "Sigma Captions",
                    routeName: '/captions',
                  ),
                  buildCard(
                    context,
                    color: Colors.teal,
                    icon: Icons.favorite,
                    label: "Favorites",
                    routeName: '/favorites',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard(
                    context,
                    color: const Color.fromARGB(255, 30, 92, 123),
                    icon: Icons.sentiment_dissatisfied,
                    label: "Sad Captions",
                    routeName: '/sad_captions',
                  ),
                  buildCard(
                    context,
                    color: Colors.orange,
                    icon: Icons.emoji_emotions,
                    label: "Funny Captions",
                    routeName: '/funny_captions',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard(
                    context,
                    color: Colors.green,
                    icon: Icons.lightbulb,
                    label: "Motivational",
                    routeName: '/motivational_captions',
                  ),
                  buildCard(
                    context,
                    color: Colors.blueGrey,
                    icon: Icons.nature_people,
                    label: "Life Captions",
                    routeName: '/life_captions',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard(
                    context,
                    color: Colors.pinkAccent,
                    icon: Icons.favorite, // Romantic context
                    label: "Romantic Captions",
                    routeName: '/romantic_captions',
                  ),
                  buildCard(
                    context,
                    color: Colors.lightBlueAccent,
                    icon: Icons.group, // Friendship context
                    label: "Friendship Captions",
                    routeName: '/friendship_captions',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard(
                    context,
                    color: Colors.amber,
                    icon: Icons.cake, // Birthday context
                    label: "Birthday Captions",
                    routeName: '/birthday_captions',
                  ),
                  buildCard(
                    context,
                    color: Colors.redAccent,
                    icon: Icons
                        .heart_broken_outlined, // Updated for compatibility
                    label: "Breakup Captions",
                    routeName: '/love_failure_captions',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Method to Build Cards
  Widget buildCard(BuildContext context,
      {required Color color,
      required IconData icon,
      required String label,
      required String routeName}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        child: SizedBox(
          width: 155, // Fixed width
          height: 150, // Fixed height
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
