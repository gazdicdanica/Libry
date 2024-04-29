import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/screens/favorites_screen.dart';
import 'package:flutter_internship_2024_app/presentation/screens/my_account_screen.dart';
import 'package:flutter_internship_2024_app/presentation/screens/platforms_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_internship_2024_app/keys.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const PlatformsScreen(),
    FavoritesScreen(),
    const MyAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions,),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTap,
        destinations: [
          NavigationDestination(
              key: K.homeBtn,
              icon: Icon(
                MdiIcons.packageVariantClosed,
              ),
              label: t.navigation_home),
          NavigationDestination(
              key: K.favoritesBtn,
              icon: const Icon(
                Icons.favorite_border,
              ),
              label: t.navigation_favorites),
          NavigationDestination(
              key: K.accountBtn,
              icon: const Icon(
                Icons.person,
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
