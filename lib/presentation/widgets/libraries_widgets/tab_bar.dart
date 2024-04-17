import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      child: TabBar(
        indicator: const BoxDecoration(
          color: Color.fromRGBO(205, 232, 223, 1),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: textColor,
        tabs: <Widget>[
          Tab(
            text: t.tab_most_popular,
          ),
          Tab(
            text: t.tab_newest,
          ),
        ],
      ),
    );
  }
}
