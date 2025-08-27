class Quote {
  final int quoteId;
  final String quote;
  final String author;
  final List<String> tags;

  const Quote({
    required this.quoteId,
    required this.quote,
    required this.author,
    required this.tags,
  });

  factory Quote.fromFileOfData(List<dynamic> row) {
    return Quote(
      quoteId: row[0],
      quote: row[1].toString(),
      author: row[2].toString(),
      tags: row[3]
          .toString()
          .split(',')
          .map((tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .toList(),
    );
  }

  @override
  String toString() {
    return '''
    Quote(
      quoteId: $quoteId,
      quote: "$quote",
      author: "$author",
      tags: ${tags.map((t) => " '$t' ").toList()},
    )
    ''';
  }
}
