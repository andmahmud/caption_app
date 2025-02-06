import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  // Function to launch URL (e.g., Facebook or website)
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Hello&body=This is a test email',
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not send an email to $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Developer Info",
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
                  // Display contact information (could be a dialog or expanded section)
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Contact Info"),
                      content: const Text(
                        "Phone: 01939237861\nEmail: andmahmud2255@email.com\nFacebook: www.facebook.com/andmahmud2255",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Close"),
                        ),
                      ],
                    ),
                  );
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
                        Icons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _launchURL('https://www.facebook.com/andmahmud2255');
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
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _sendEmail('andmahmud2255@email.com');
                    },
                  ),
                ],
              ),
              const Divider(color: Colors.teal),
              const SizedBox(height: 20),
              const Text(
                "I am a skilled software developer with expertise in Dart, Flutter, Python, and Django. I specialize in building cross-platform mobile apps and scalable web solutions. With experience in state management, responsive UI design, and backend integration, I am passionate about delivering high-quality, user-friendly applications that solve real-world problems.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
