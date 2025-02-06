import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:url_launcher/url_launcher_string.dart";

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                const url = 'https://your-website.com';
                launchUrlString(url);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Share this app'),
              onTap: () async {
                const url = 'https://your-website.com';
                launchUrlString(url);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text('Rate us on play store'),
              onTap: () async {
                const url = 'https://your-website.com';
                launchUrlString(url);
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
                const url = 'https://your-website.com';
                launchUrlString(url);
              },
            ),
            ListTile(
              leading: Image.asset("assets/icons/facebook.png", height: 25),
              title: const Text('Facebook'),
              onTap: () async {
                const url = 'https://your-website.com';
                launchUrlString(url);
              },
            ),
            ListTile(
              leading: Image.asset("assets/icons/linkedin.png", height: 30),
              title: const Text('Linkedin'),
              onTap: () async {
                const url = 'https://your-website.com';
                launchUrlString(url);
              },
            ),
            ListTile(
              leading: Image.asset("assets/icons/twitter.png", height: 30),
              title: const Text('Twitter'),
              onTap: () async {
                const url = 'https://your-website.com';
                launchUrlString(url);
              },
            ),
          ],
        ),
      ),
    );
  }
}
