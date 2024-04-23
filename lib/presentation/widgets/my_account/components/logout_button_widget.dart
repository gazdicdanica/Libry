import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/custom_dialog_widget.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      onPressed: () async {
        final confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              title: t.logout,
              content: t.confirm_logout,
              okText: t.yes,
              cancelText: t.no,
            );
          },
        );
        if (confirmed == true) {
          await FirebaseAuth.instance.signOut();
        }
      },
      child: Text(
        t.logout,
        style: const TextStyle(color: redColor, fontSize: 22),
      ),
    );
  }
}
