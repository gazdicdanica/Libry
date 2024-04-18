import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/change_button_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/divider_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/label_widget.dart';

class SettingsInfoRow extends StatelessWidget {
  const SettingsInfoRow({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            LabelWidget(label: label),
            Expanded(
              child: ChangeButtonWidget(
                onPressed: () {},
              ),
            ),
          ],
        ),
        const Row(
          children: [
            DividerWidget(),
            Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ],
    );
  }
}
