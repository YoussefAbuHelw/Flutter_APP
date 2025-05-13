class Quote {
  String? quote;
  String? author;
  String? category;

  Quote({required this.category, required this.author, required this.quote});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quote: json['quote'],
      author: json['author'],
      category: json['category'],
    );
  }
}
