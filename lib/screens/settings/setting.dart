import "package:cloud_firestore/cloud_firestore.dart";
import "package:dailyquotes/preferences/preferences.dart";
import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";
import "package:url_launcher/url_launcher_string.dart";

import "../../data/app_urls.dart";

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<String> _languages = [];
  String _selectedLanguage = Preferences.getLanguage();

  @override
  void initState() {
    super.initState();
    loadLanguages();
  }

  Future<void> loadLanguages() async {
    final langs = await getLanguages();
    setState(() {
      _languages = langs;
    });
  }

  Future<List<String>> getLanguages() async {
    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('app_info')
          .doc('info')
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        List<dynamic> languages = data['languages'];

        return languages.map((lang) => lang.toString()).toList();
      } else {
        throw Exception("Document does not exist.");
      }
    } catch (e) {
      print("Error getting languages: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "General",
              style: TextStyle(
                color: Colors.deepOrange.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Privacy policy'),
              onTap: () async {
                launchUrlString(AppUrls.privacyPolicyUrl);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Share this app'),
              onTap: () async {
                await Share.share(AppUrls.playStoreUrl);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text('Rate us on play store'),
              onTap: () async {
                launchUrlString(AppUrls.playStoreUrl);
              },
            ),
            ListTile(
              leading: const Icon(Icons.translate),
              title: const Text('Language'),
              trailing: PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    _selectedLanguage = value;
                    Preferences.saveLanguage(value);
                  });
                },
                itemBuilder: (BuildContext context) {
                  return _languages.map((String lang) {
                    return PopupMenuItem<String>(
                      value: lang,
                      child: Text(lang),
                    );
                  }).toList();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(_selectedLanguage),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Follow Us",
              style: TextStyle(
                color: Colors.deepOrange.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Image.asset("assets/icons/instagram.png", height: 25),
              title: const Text('Instagram'),
              onTap: () async {
                launchUrlString(AppUrls.instagramUrl);
              },
            ),
            ListTile(
              leading: Image.asset("assets/icons/facebook.png", height: 25),
              title: const Text('Facebook'),
              onTap: () async {
                launchUrlString(AppUrls.facebookUrl);
              },
            ),
            ListTile(
              leading: Image.asset("assets/icons/linkedin.png", height: 30),
              title: const Text('Linkedin'),
              onTap: () async {
                launchUrlString(AppUrls.linkedinUrl);
              },
            ),
            ListTile(
              leading: Image.asset("assets/icons/twitter.png", height: 30),
              title: const Text('Twitter'),
              onTap: () async {
                //launchUrlString(AppUrls.twitterUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}
