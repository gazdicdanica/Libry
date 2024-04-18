import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 15.0, right: 15.0),
      child: Container(
        height: 1,
        color: const Color.fromRGBO(0, 0, 0, 0.25),
      ),
    );
  }
}
