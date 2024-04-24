import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String okText;
  final String cancelText;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.okText,
    required this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(okText),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(cancelText),
        ),
        
      ],
    );
  }
}
