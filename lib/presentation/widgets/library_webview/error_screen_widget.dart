import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/error_message_widget.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  final void Function() refreshFunction;

  const ErrorScreen(
      {super.key, required this.errorMessage, required this.refreshFunction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorMessageWidget(
        errorMessage: errorMessage,
        refreshFunction: refreshFunction,
      ),
    );
  }
}
