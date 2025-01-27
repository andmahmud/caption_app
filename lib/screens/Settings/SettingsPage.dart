import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text("Account"),
              leading: const Icon(Icons.account_circle),
              onTap: () {
                // Handle account settings
              },
            ),
            ListTile(
              title: const Text("Notifications"),
              leading: const Icon(Icons.notifications),
              onTap: () {
                // Handle notification settings
              },
            ),
            ListTile(
              title: const Text("Privacy"),
              leading: const Icon(Icons.lock),
              onTap: () {
                // Handle privacy settings
              },
            ),
            ListTile(
              title: const Text("Help"),
              leading: const Icon(Icons.help),
              onTap: () {
                // Handle help section
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle logout or other action
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}