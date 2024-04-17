import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/locale_bloc/locale_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton(
      {super.key,
      required this.text,
      required this.locale});

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
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: _isSelectedLocale(state) ? themeSeedColor : Colors.transparent,
            ),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: _isSelectedLocale(state) 
                      ? textColor
                      : const Color.fromRGBO(0, 0, 0, 0.25)),
            ),
          );
        },
      ),
    );
  }

  bool _isSelectedLocale(LocaleState state)=> LocaleSettings.currentLocale == locale;
  
}
