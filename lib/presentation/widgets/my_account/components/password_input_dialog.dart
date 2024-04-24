import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

class PasswordInputDialog extends StatefulWidget {
  const PasswordInputDialog({super.key, required this.onConfirm});
  final Function(String password) onConfirm;

  @override
  State<StatefulWidget> createState() {
    return _PasswordInputDialogState();
  }
}

class _PasswordInputDialogState extends State<PasswordInputDialog> {
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AlertDialog(
      title: Text(t.reauthenticate),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(t.enter_password),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: t.password),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
          child: Text(t.confirm),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(t.cancel),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
