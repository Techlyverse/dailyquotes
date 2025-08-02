import 'package:dailyquotes/firebase_options.dart';
import 'package:dailyquotes/preferences/preferences.dart';
import 'package:dailyquotes/services/quote_data_processing.dart';
import 'package:dailyquotes/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home/home_screen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugging if the csv data is getting parsed -MG
  // final quotes = await QuoteDataProcessing();
  // for (var quote in quotes.take(10)){
  //   print('"${quote.quote}","${quote.author}","${quote.tags}"');
  // }
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   await Preferences.initPreferences();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Quotes App',
        home:  HomeScreen(),
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
