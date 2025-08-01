class Quote{
  final String quoteId;
  final String quote;
  final String author;
  final List<String> tags;

  Quote({ required this.quoteId, required this.quote, required this.author, required this.tags});

  factory Quote.fromFileOfData(List<dynamic> givenRow) {
    return Quote(
      quoteId: givenRow[0].toString(),
      quote: givenRow[1].toString(),
      author: givenRow[2].toString(),
      tags: givenRow[3].toString().split(',').map( (tag) => tag.trim()).where((tag) => tag.isNotEmpty).toList(),
    );
  }

  static List<String> getAllDistinctTags(List<Quote> quotes){
    final tagSet = <String>{};
    for(var quote in quotes){
      tagSet.addAll(quote.tags);
    }

    return tagSet.toList();
  }


}