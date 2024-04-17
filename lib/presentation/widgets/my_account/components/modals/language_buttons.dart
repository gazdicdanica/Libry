import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/modals/toggle_button.dart';

class LanguageButtons extends StatelessWidget {
  const LanguageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ToggleButton(text: t.language_en, isSelected: true, locale: AppLocale.en,),
            const SizedBox(height: 15),
            ToggleButton(text: t.language_sr, isSelected: false, locale: AppLocale.sr,),
          ],
        ),
      ],
    );
  }
}
