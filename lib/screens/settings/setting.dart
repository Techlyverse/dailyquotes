import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";
import "package:url_launcher/url_launcher.dart";

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => SettingScreen_state();
}

class SettingScreen_state extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'General Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
            padding: const EdgeInsets.only(left: 11, right: 11, top: 20),
            child: ListTile(
                leading: const Icon(Icons.link),
                title: const Text(
                  'More by us',
                ),
                onTap: () async {
                  const url = 'https://your-website.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                })),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              leading: const Icon(Icons.thumb_up),
              title: const Text(
                'Leave us a Review',
              ),
              onTap: () async {
                const url = 'https://your-website.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              leading: Icon(Icons.feedback),
              title: const Text(
                'Vote on next features',
              ),
              onTap: () async {
                const url = 'https://your-website.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'Help',
              ),
              onTap: () async {
                const url = 'https://your-website.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Follow Us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11, top: 18),
          child: ListTile(
              leading: const FaIcon(FontAwesomeIcons.instagram),
              title: const Text(
                'Instagram',
              ),
              onTap: () async {
                const url = 'https://your-website.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              leading: const Icon(Icons.facebook),
              title: const Text(
                'Facebook',
              ),
              onTap: () async {
                const url = 'https://your-website.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Other",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11, top: 18),
          child: ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text(
                'Privacy Policy',
              ),
              onTap: () async {
                const url = 'https://your-website.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              leading: const Icon(Icons.gavel),
              title: const Text(
                'Terms & Conditions',
              ),
              onTap: () async {
                const url = 'https://your-website.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ),
      ]),
    );
  }
}
