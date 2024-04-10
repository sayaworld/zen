// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:zen/theme/configTheme.dart';

// initializing the api url
const String quotesUrl = "https://zenquotes.io/api/quotes/";


class ShuffleQuotes extends StatefulWidget {
  const ShuffleQuotes({super.key});

  @override
  State<ShuffleQuotes> createState() => _ShuffleQuotesState();
}

class _ShuffleQuotesState extends State<ShuffleQuotes> {
  late Future<List<dynamic>> _futureData;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _futureData = getApi(quotesUrl);
  }

  Future<List<dynamic>> getApi(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _nextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _futureData.toString().length;
    });
  }

  void _previousQuote() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _futureData.toString().length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _previousQuote,
      onTap: _nextQuote,
      child: Container(
        height: 160,
        width: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/sea.jpg"),
              fit: BoxFit.cover
              ),
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10)),
        child: FutureBuilder<List<dynamic>>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.onError,
                highlightColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Container(
                        height: 20.0,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withAlpha(10),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 20.0,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withAlpha(10),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data![_currentIndex]['q'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        )),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: accentColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "${snapshot.data![_currentIndex]['a']}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text('No data available');
              }
            }
          },
        ),
      ),
    );
  }
}
