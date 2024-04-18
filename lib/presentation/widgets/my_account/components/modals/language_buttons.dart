import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/modals/language_toggle_button.dart';

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
            LanguageToggleButton(text: t.language_en, locale: AppLocale.en,),
            const SizedBox(height: 15),
            LanguageToggleButton(text: t.language_sr, locale: AppLocale.sr,),
          ],
        ),
      ],
    );
  }
}
