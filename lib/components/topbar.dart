// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:provider/provider.dart';

import '../theme/configTheme.dart';
import '../theme/themeProvider.dart';

class topBar extends StatefulWidget {

  const topBar({super.key});

  @override
  State<topBar> createState() => _topBarState();
}

class _topBarState extends State<topBar> {
  bool _isFirstIcon = true;
  void _toggleIcon() {
    setState(() {
      _isFirstIcon = !_isFirstIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            _toggleIcon;
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: _isFirstIcon
                ? Icon(
              Iconsax.moon_bold,
              key: ValueKey(Iconsax.moon_bold),
              color: Theme.of(context).colorScheme.secondary,
            )
                : Icon(
              Iconsax.sun_1_bold,
              key: ValueKey(Iconsax.sun_1_bold),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),

        Text(
          'Feel Better',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Theme.of(context).colorScheme.onError,
                letterSpacing: .5,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),

        Badge(
          backgroundColor: accentColor,
          child: Icon(
              Iconsax.notification_bold,
              color: Theme.of(context).colorScheme.secondary),
        )

      ],
    );
  }
}

