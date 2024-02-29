import 'package:flutter/material.dart';
import '../../data/data.dart';
import '../settings/setting.dart';
import 'themecard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: backgroundGradient,
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!), fit: BoxFit.cover)
            : null,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Be the change you wish to see in the world.',
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  SizedBox(
                    height: 45,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text(
                          "Inspirational",
                          style: TextStyle(),
                        ),
                        icon: const Icon(Icons.category_outlined)),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return theme(
                                onDismiss: updateUIAfterBottomSheetDismiss);
                          },
                        );

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ThemeCard()));
                      },
                      icon: const Icon(Icons.format_paint)),
                  const SizedBox(width: 15),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()));
                    },
                    icon: const Icon(Icons.settings),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateUIAfterBottomSheetDismiss() {
    setState(() {});
  }
}
