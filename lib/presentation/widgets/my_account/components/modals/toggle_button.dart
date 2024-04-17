import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key, required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: isSelected ? themeSeedColor : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: isSelected ? textColor : const Color.fromRGBO(0, 0, 0, 0.25)),
        ),
      ),
    );
  }
}
