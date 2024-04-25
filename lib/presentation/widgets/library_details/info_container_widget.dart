import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/library_details/label_widget.dart';

class InfoContainers extends StatelessWidget {
  final List<String> labels;
  final List<String> values;

  const InfoContainers({
    super.key,
    required this.labels,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 32),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: labels.asMap().entries.map((entry) {
                return Row(
                  children: [
                    LabelWidget(
                      label: entry.value,
                      isLastInRow: entry.key == labels.length - 1,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
              ),
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.25),
                  width: 1,
                ),
                top: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.25),
                  width: 0.5,
                ),
                left: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.25),
                  width: 2,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(-2, 0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: values.asMap().entries.map((entry) {
                return Row(
                  children: [
                    LabelWidget(
                      label: entry.value,
                      isLastInRow: entry.key == labels.length - 1,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
