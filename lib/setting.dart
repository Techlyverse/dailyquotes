import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => SettingScreen_state();
}

class SettingScreen_state extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'General Settings',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: GoogleFonts.openSans().fontFamily),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11, top: 20),
          child: ListTile(
              tileColor: Colors.deepPurple,
              leading: Icon(Icons.link),
              title: Text('More by us',
                  style:
                      TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              tileColor: Colors.deepPurple,
              leading: Icon(Icons.thumb_up),
              title: Text('Leave us a Review',
                  style:
                      TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              tileColor: Colors.deepPurple,
              leading: Icon(Icons.feedback),
              title: Text('Vote on next features',
                  style:
                      TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              tileColor: Colors.deepPurple,
              leading: Icon(Icons.help),
              title: Text('Help',
                  style:
                      TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Follow Us",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                fontFamily: GoogleFonts.openSans().fontFamily),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11, top: 18),
          child: ListTile(
              tileColor: Colors.deepPurple,
              leading: FaIcon(FontAwesomeIcons.instagram),
              title: Text(
                'Instagram',
                style: TextStyle(fontFamily: GoogleFonts.openSans().fontFamily),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              tileColor: Colors.deepPurple,
              leading: Icon(Icons.facebook),
              title: Text('Facebook',
                  style:
                      TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Other",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                fontFamily: GoogleFonts.openSans().fontFamily),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11, top: 18),
          child: ListTile(
              tileColor: Colors.deepPurple,
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy',
                  style:
                      TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11),
          child: ListTile(
              tileColor: Colors.deepPurple,
              leading: Icon(Icons.gavel),
              title: Text('Terms & Conditions',
                  style:
                      TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))),
        ),
      ]),
    );
  }
}
