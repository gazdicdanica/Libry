import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/locale_bloc/locale_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/change_button_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/divider_widget.dart';

class SettingsInfoRow extends StatelessWidget {
  const SettingsInfoRow({
    super.key,
    required this.label,
    required this.onPressed,
    required this.subtitle,
  });

  final String label;
  final String subtitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: BlocBuilder<LocaleBloc, LocaleState>(
                builder: (context, state) {
                  return ListTile(
                      title: Text(
                        label,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ));
                },
              ),
            ),
            ChangeButtonWidget(
              onPressed: onPressed,
            ),
          ],
        ),
        const DividerWidget(),
      ],
    );
  }
}
