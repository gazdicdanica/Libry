import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/screens/favorites_screen.dart';
import 'package:flutter_internship_2024_app/presentation/screens/my_account_screen.dart';
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
    const FavoritesScreen(),
    const MyAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        elevation: 5,
        backgroundColor: bottomNavigationColor,
        surfaceTintColor: bottomNavigationColor,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTap,
        indicatorColor: themeSeedColor,
        destinations: [
          NavigationDestination(
              icon: Icon(
                MdiIcons.packageVariantClosed,
                color: _selectedIndex == 0
                    ? textColor
                    : textColor.withOpacity(0.6),
              ),
              label: t.navigation_home),
          NavigationDestination(
              icon: Icon(
                Icons.favorite_border,
                color: _selectedIndex == 1
                    ? textColor
                    : textColor.withOpacity(0.6),
              ),
              label: t.navigation_favorites),
          NavigationDestination(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 2
                    ? textColor
                    : textColor.withOpacity(0.6),
              ),
              label: t.navigation_profile),
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
