import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:sectiontasks/quote/quote_model.dart';

Future<List<Quote>> fetchQuote() async {
  final response = await http.get(
    Uri.parse('https://api.api-ninjas.com/v1/quotes'),

    headers: {'X-Api-Key': '5uQ82syLG1mtthAugB3ZOQ==mBbybmSk3Lnz3pFe'},
  );
  if (response.statusCode == 200) {
    List<dynamic> quoteData = json.decode(response.body);
    return quoteData.map((quote) => Quote.fromJson(quote)).toList();
  } else {
    throw Exception('Failed to fetch quote');
  }
}
