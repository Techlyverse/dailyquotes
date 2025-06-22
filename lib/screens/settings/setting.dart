import "package:dailyquotes/preferences/preferences.dart";
import "package:dailyquotes/screens/home/home_screen.dart";
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
   late List<String> languages = [] ;


  @override
  Widget build(BuildContext context) {
    List<PopupMenuEntry<dynamic>> menuItems = languages
        .map((language) => PopupMenuItem(
      value: language,
      child: Text(language),
    ))
        .toList();
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
              leading: const Icon(Icons.language_outlined),
              title: const Text('Language'),
              onTap: () async {
                languages = await HomeScreen().getLanguages();

                debugPrint("Language tapped");
                debugPrint("${menuItems[0]}");
                debugPrint("${languages.isNotEmpty}");
                PopupMenuButton<dynamic>(
                  itemBuilder: (BuildContext context) {

                    return menuItems;
                  },
                  onSelected: (dynamic language) {
                    // Handle the selected option
                    Preferences.saveLanguages(language);
                  },
                );
              },
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
                launchUrlString(AppUrls.twitterUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}
