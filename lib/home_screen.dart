import 'package:dailyquotes/quote_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/green.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              return const QuoteScreen();
            }),
      ),
    );
  }
}
