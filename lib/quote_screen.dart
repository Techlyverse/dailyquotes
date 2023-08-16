import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Text(
          "If you can't be the sun be the star, Be the best of whatever you are",
          style: GoogleFonts.quicksand(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
