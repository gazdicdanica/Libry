import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton(
      {super.key, required this.text, required this.themeMode});

  final String text;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(themeMode));
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(50.0),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: _getBackgroundColor(context, state),
            ),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: _isSelectedTheme(state)
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.25)),
            ),
          );
        },
      ),
    );
  }

  bool _isSelectedTheme(ThemeState state) => state is ThemeChanged && state.themeMode == themeMode;

  Color _getBackgroundColor(BuildContext context, ThemeState state) {
    if (_isSelectedTheme(state)) {
      final brightness = Theme.of(context).brightness;

      return brightness == Brightness.light ? themeSeedColor : darkGreenColor;
    }
    return Colors.transparent;
  }
}
