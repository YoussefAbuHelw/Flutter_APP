import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/quote/API_Service.dart';
import 'package:sectiontasks/quote/quote_model.dart';

import '../login/shared_prefs_service.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late Future<List<Quote>> data;

  @override
  void initState() {
    data = fetchQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeViewModel = context.watch<ThemeViewModel>();
    final _prefsService = context.watch<SharedPrefsService>();

    return Scaffold(
      appBar: AppBar(title: Text("Quotes"), centerTitle: true),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img_1.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder:
                    (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data![index].quote!,
                            style: TextStyle(
                              color:
                                  _prefsService.isDarkMode
                                      ? Colors.black
                                      : Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data![index].author!,
                            style: TextStyle(
                              color:
                                  _prefsService.isDarkMode
                                      ? Colors.black
                                      : Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data![index].category!,
                            style: TextStyle(
                              color:
                                  _prefsService.isDarkMode
                                      ? Colors.black
                                      : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
