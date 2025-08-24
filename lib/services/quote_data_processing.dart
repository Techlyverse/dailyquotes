import 'package:dailyquotes/models/quotes.dart';
import 'package:flutter/services.dart';

Future<List<Quote>> quoteDataProcessing() async {
  final dataFromFile = await rootBundle.loadString('assets/quotes/en_quotes.csv');
  final processedData = dataFromFile.split('\n').where( (oneLine) => oneLine.trim().isNotEmpty).toList();
  final dataLines = processedData.skip(1);
  List<Quote> allTheQuotes = [];

  for (var line in dataLines) {
    final row = _splitIndividualLines(line);
    allTheQuotes.add(Quote.fromFileOfData(row));
  }

  return allTheQuotes.where((e)=> e.quote.length < 250).toList();
}

List<String> _splitIndividualLines(String oneLine) {
  List<String> splittedLine = [];
  String currentElement = '';
  bool inDoublequotes = false;

  for(int i = 0; i < oneLine.length; i++) {
    var char = oneLine[i];

    if(char == '"'){
      inDoublequotes = !inDoublequotes;
    } else if (char == ',' && !inDoublequotes) {
      splittedLine.add(currentElement);
      currentElement = '';
    } else {
      currentElement += char;
    }
  }

  splittedLine.add(currentElement); // for adding the the last tag field -MG
  return splittedLine;

}