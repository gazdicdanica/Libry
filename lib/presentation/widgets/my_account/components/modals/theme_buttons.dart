import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/modals/theme_toggle_button.dart';

class ThemeButtons extends StatelessWidget{
  const ThemeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeToggleButton(text: t.theme_system, themeMode: ThemeMode.system,),
            const SizedBox(height: 15),
            ThemeToggleButton(text: t.theme_light, themeMode: ThemeMode.light,),
            const SizedBox(height: 15),
            ThemeToggleButton(text: t.theme_dark, themeMode: ThemeMode.dark,),
          ],
        ),
      ],
    );
  }
  

}