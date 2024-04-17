import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class ChangeButtonWidget extends StatelessWidget {
  const ChangeButtonWidget({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(children: [
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: darkGreenColor,
                    padding: const EdgeInsets.all(4.0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size.zero,
          ),
          child: Text(t.change,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
          onPressed: () {},
        ),
      ]),
    );
  }
}
