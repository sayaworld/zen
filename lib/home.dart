// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import 'components/shuffle_quotes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(

                    "Let's start meditation\ntoday for your better day.",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(

                        color: Theme.of(context).colorScheme.onError,
                        letterSpacing: .5,
                        fontSize: 29,
                        fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),


                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).colorScheme.primaryContainer
                  ),
                  child: TextField(
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                    decoration: InputDecoration(

                        border: InputBorder.none,
                        prefixIcon: Icon(OctIcons.search, color: Color.fromARGB(255, 192, 192, 192),),
                        hintText: "Search",
                        hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            )
                        )
                    ),
                  ),
                ),

                SizedBox(
                  height: 35,
                ),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Daily Quotes', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        )
                    ),),

                    Text('See all', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        )
                    ),)
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                ShuffleQuotes(),

                SizedBox(
                  height: 35,
                ),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Recommendations', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        )
                    ),),

                    Text('See all', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                        )
                    ),)
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                Container(
                  height: 150, width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container()
                    ],
                  ),
                )

              ],
            ),
          ),
      ),
    );
  }
}
