import 'package:flutter/material.dart';
import 'package:caption/screens/Drawer/Drawer.dart';
import 'package:caption/screens/Settings/SettingsPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // Height of the AppBar
        child: ClipPath(
          clipper: BottomRoundedClipper(), // Custom clipper for rounded corners
          child: AppBar(
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
            title: _isSearching
                ? TextField(
                    controller: _searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: const Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                    style: const TextStyle(color: Colors.white),
                  )
                : const Center(child: Text("Enjoy the Status")),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                onPressed: () {
                  setState(() {
                    if (_isSearching) {
                      _isSearching = false;
                      _searchController.clear();
                    } else {
                      _isSearching = true;
                    }
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawer: const DrawerScreen(),
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
                    image: 'assets/images/sigma.png',
                    label: "Sigma Captions",
                    routeName: '/captions',
                  ),
                  // buildCard(
                  //   context,
                  //   image: 'assets/images/favorites.png',
                  //   label: "Favorites",
                  //   routeName: '/favorites',
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard(
                    context,
                    image: 'assets/images/sad.png',
                    label: "Sad Captions",
                    routeName: '/sad_captions',
                  ),
                  buildCard(
                    context,
                    image: 'assets/images/funny.png',
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
                    image: 'assets/images/motivational.png',
                    label: "Motivational",
                    routeName: '/motivational_captions',
                  ),
                  buildCard(
                    context,
                    image: 'assets/images/life.png',
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
                    image: 'assets/images/Romantic.png',
                    label: "Romantic Captions",
                    routeName: '/romantic_captions',
                  ),
                  buildCard(
                    context,
                    image: 'assets/images/Friendship.png',
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
                    image: 'assets/images/Birthday.png',
                    label: "Birthday Captions",
                    routeName: '/birthday_captions',
                  ),
                  buildCard(
                    context,
                    image: 'assets/images/Breakup.png',
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

  // Helper Method to Build Cards with Image
  Widget buildCard(BuildContext context,
      {required String image,
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
        color: Colors.teal,
        child: SizedBox(
          width: 155, // Fixed width
          height: 150, // Fixed height
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 60,
                width: 60,
                fit: BoxFit.contain,
              ),
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

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20); // Left bottom corner
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 20); // Right bottom corner
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip unless necessary
  }
}
