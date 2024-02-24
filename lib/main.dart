import 'package:dailyquotes/change_theme.dart';
import 'package:dailyquotes/setting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';





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
      //TODO: create theme file
      theme: ThemeData.dark(
        useMaterial3: true,
      ),

      //TODO: use system theme mode
      home: MyHomePage(),
    );
  }
}

//TODO: Add keys and const to constructor
class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/blue.jpg'),
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

                // TODO: fetch this data from firebase
                child: Text(
                  'Be the change you wish to see in the world.',
                  style: TextStyle(
                      color: Colors.black, // Adjust text color for visibility
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.openSans().fontFamily),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Text(
                  " - Mahatma Gandhi",
                  style: TextStyle(
                      color: Colors.black, // Adjust text color for visibility
                      fontSize: 20.0,
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.ios_share,
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                      ))
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThemeCard()));
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
