import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/theme/themeProvider.dart';

import 'index.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      //theme settings
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context).themeData,

      //other
      // debugShowCheckedModeBanner: false,

      //entry point
      title: 'Zen',
      home:Index(),
    );
  }}