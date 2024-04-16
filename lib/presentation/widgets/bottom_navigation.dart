import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(MdiIcons.codeTags, color: textColor,),),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: textColor,),),
          const BottomNavigationBarItem(icon: Icon(Icons.person, color: textColor,),),
        ],
      ),
    );
  }
}
