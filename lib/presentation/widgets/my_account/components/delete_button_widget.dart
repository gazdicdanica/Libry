import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/custom_dialog_widget.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      onPressed: () async {
        final confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              title: t.delete_account,
              content: t.confirm_delete_account,
              okText: t.yes,
              cancelText: t.no,
            );
          },
        );
        if (confirmed == true) {
          messenger.removeCurrentSnackBar();
          messenger.showSnackBar(
            SnackBar(content: Text(t.sorry_youre_leaving)),
          );
          Timer(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const AuthScreen(),
              ),
            );
          });

          try {
            await user.delete();
          } catch (e) {
            messenger.removeCurrentSnackBar();
            messenger.showSnackBar(
              SnackBar(content: Text(t.delete_account_error)),
            );
          }
        }
      },
      child: Text(
        t.delete_account,
        style: const TextStyle(color: darkGreenColor, fontSize: 18),
      ),
    );
  }
}
