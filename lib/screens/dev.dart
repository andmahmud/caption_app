import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "About the Developer",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/dev.png'),
              ),
              const SizedBox(height: 10),
              const Text(
                "MD MAHMUDUL HASAN",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Mobile App Developer",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Contact Info",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Container(
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // Add Call functionality
                    },
                  ),
                  IconButton(
                    icon: Container(
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // Add Facebook functionality
                    },
                  ),
                  // IconButton(
                  //   icon: Container(
                  //     decoration: const BoxDecoration(
                  //       color: Colors.teal,
                  //       shape: BoxShape.circle,
                  //     ),
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: const Icon(
                  //       Icons.phone,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     // Add Phone functionality
                  //   },
                  // ),
                  IconButton(
                    icon: Container(
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const Divider(color: Colors.teal),
              const SizedBox(height: 20),
              const Text(
                "Assalamu Alaikum. I am a proud Bangladeshi Citizen. As an Mobile App Developer, I strive to make meaningful contributions in technology. Wishing everyone success and blessings.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
