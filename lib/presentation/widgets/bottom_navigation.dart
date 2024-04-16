import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/screens/platforms_screen.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const PlatformsScreen(),
    const Center(
      child:  Text(
        'Index 1: Favorites',
      ),
    ),
    const Center(
      child: Text(
        'Index 2: Profile',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.packageVariantClosed,
              color: textColor,
            ),
            label: t.navigation_home
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.favorite_border,
              color: textColor,
            ),
            label: t.navigation_favorites
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              color: textColor,
            ),
            label: t.navigation_profile
          ),
        ],
      ),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
