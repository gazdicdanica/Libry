import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/divider_widget.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            value,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const DividerWidget(),
      ],
    );
  }
}
