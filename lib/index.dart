// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zen/theme/configTheme.dart';
import 'package:zen/views/meditations.dart';
import 'package:zen/views/profile.dart';
import 'package:zen/views/progress.dart';

import 'components/topbar.dart';
import 'home.dart';

/// Flutter code sample for

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() =>
      _IndexState();
}

class _IndexState
    extends State<Index> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Meditations(),
    Progress(),
    Profile()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: topBar(),
        elevation: 10,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            splashColor: Colors.transparent),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Iconsax.home_1_outline), label: 'Home', activeIcon: Icon(Iconsax.home_bold)),
            BottomNavigationBarItem(icon: Badge(
              backgroundColor: accentColor,
              child: Icon(Iconsax.command_outline),), label: 'Meditations', activeIcon: Icon(Iconsax.command_bold)),
            BottomNavigationBarItem(icon: Badge(
              backgroundColor: accentColor,
              child: Icon(Iconsax.activity_outline),), label: 'Progress', activeIcon: Icon(Iconsax.activity_bold)),
            BottomNavigationBarItem(icon: Icon(Iconsax.user_outline), label: 'Profile', activeIcon: Icon(Iconsax.user_bold)),
          ],
          selectedLabelStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
              )
          ),
          unselectedLabelStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
              )
          ),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.primary,
          currentIndex: _selectedIndex,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          selectedItemColor: accentColor,
          elevation: 0,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
