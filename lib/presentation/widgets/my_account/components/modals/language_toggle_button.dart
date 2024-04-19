import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/locale_bloc/locale_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton(
      {super.key, required this.text, required this.locale});

  final String text;
  final AppLocale locale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          BlocProvider.of<LocaleBloc>(context).add(ChangeLocale(locale));
          Navigator.pop(context);
        },
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: _getBackgroundColor(context),
          ),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: _isSelectedLocale()
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.25)),
          ),
        ));
  }

  bool _isSelectedLocale() => LocaleSettings.currentLocale == locale;

  Color _getBackgroundColor(BuildContext context) {
    if (_isSelectedLocale()) {
      final brightness = Theme.of(context).brightness;

      return brightness == Brightness.light ? themeSeedColor : darkGreenColor;
    }
    return Colors.transparent;
  }
}
