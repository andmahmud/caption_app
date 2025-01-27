import 'package:caption/screens/language.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _settingsOptions = [
    "Account",
    "Notifications",
    "Privacy",
    "Help",
    "Font Size",
    "Language",
  ];
  List<String> _filteredOptions = [];

  final double _fontSize = 20.0;

  final Map<String, IconData> _icons = {
    "Account": Icons.account_circle,
    "Notifications": Icons.notifications,
    "Privacy": Icons.lock,
    "Help": Icons.help,
    "Font Size": Icons.text_decrease,
    "Language": Icons.language,
  };

  @override
  void initState() {
    super.initState();
    _filteredOptions = _settingsOptions;
    _searchController.addListener(_filterOptions);
  }

  void _filterOptions() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredOptions = _settingsOptions
          .where((option) => option.toLowerCase().contains(query))
          .toList();
    });
  }

  void _navigateToLanguageSelection() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LanguageSelectionPage()),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterOptions);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Settings"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search settings...",
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredOptions.length,
                itemBuilder: (context, index) {
                  final option = _filteredOptions[index];
                  return ListTile(
                    title: Text(
                      option,
                      style: TextStyle(
                          fontSize: option == "Font Size" ? _fontSize : 20.0),
                    ),
                    leading: Icon(_icons[option]),
                    onTap: () {
                      if (option == "Language") {
                        _navigateToLanguageSelection();
                      } else {}
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
