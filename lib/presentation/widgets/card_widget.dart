import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.color,
    required this.child,
    required this.onTap,
  });

  final Color color;
  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        // TODO : reroute function
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: color),
                width: 8,
                //probably gonna need to change this height
                height: 70,
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
