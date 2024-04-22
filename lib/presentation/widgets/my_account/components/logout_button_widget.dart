import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return TextButton(
      key: const Key('yes'),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      onPressed: () async {
        if (await confirm(
          context,
          title: Text(t.logout),
          content: Text(t.confirm_logout),
          textOK: Text(t.yes),
          textCancel: Text(t.no),
        )) {
          await FirebaseAuth.instance.signOut();
        }
      },
      child: Text(
        key: const Key('logout'),
        t.logout,
        style: const TextStyle(color: redColor, fontSize: 22),
      ),
    );
  }
}
