import 'package:dailyquotes/change_theme.dart';
import 'package:dailyquotes/design.dart';
import 'package:dailyquotes/setting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes App',
      theme: darkTheme(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String author = " - Mahatma Gandhi";
  final String quote = 'Be the change you wish to see in the world.';
  String backgroundImage = "assets/images/blue.jpg";

  bool liked = false;
  void _toggleLike() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          )),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  "$quote",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.openSans().fontFamily),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 200),
                child: Text("$author",
                    style: TextStyle(
                        color: Colors.black, // Adjust text color for visibility
                        fontSize: 20.0,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Share.share('$quote - $author');
                      },
                      icon: const Icon(
                        Icons.ios_share,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: _toggleLike,
                    icon: Icon(
                      liked ? Icons.favorite : Icons.favorite_border,
                      color: liked ? Colors.red : Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 5.0,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Inspirational",
                            style: TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily),
                          ),
                        ),
                        icon: const Icon(Icons.category_outlined)),
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.black),
                    child: IconButton(
                        onPressed: () async {
                          String selectedImagePath = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThemeCard()));
                          if (selectedImagePath != null) {
                            setState(() {
                              backgroundImage = selectedImagePath;
                            });
                          }
                        },
                        icon: const Icon(Icons.format_paint,
                            color: Colors.deepPurpleAccent)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.black),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingScreen()));
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.deepPurpleAccent,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
