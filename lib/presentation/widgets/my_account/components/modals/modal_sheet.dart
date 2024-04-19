import 'package:flutter/material.dart';

class ModalSheet extends StatelessWidget {
  const ModalSheet({super.key, required this.buttons});
  final Widget buttons;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: const EdgeInsets.all(30.0), child: buttons),
    );
  }
}
