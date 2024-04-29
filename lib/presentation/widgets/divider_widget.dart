import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
          height: 1,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.25)),
    );
  }
}
