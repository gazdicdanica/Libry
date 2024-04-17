import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0, top: 5.0),
        child: Container(
          height: 1,
          color: const Color.fromRGBO(0, 0, 0, 0.25),
        ),
      ),
    );
  }
}
