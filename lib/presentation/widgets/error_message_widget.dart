import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/keys.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(
      {super.key, required this.errorMessage, required this.refreshFunction});

  final String errorMessage;
  final void Function() refreshFunction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(
                Icons.error_outline,
                size: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                errorMessage,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            key: K.reloadBtn ,
            onPressed: refreshFunction,
            child: const Icon(Icons.refresh),
          ),
        ),
      ],
    );
  }
}
