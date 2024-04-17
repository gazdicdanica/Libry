import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/logout_button_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/modals/language_buttons.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/modals/modal_sheet.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/profile_avatar_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/settings_info_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/user_info_widget.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ProfileAvatar(photoURL: user.photoURL),
            const SizedBox(height: 40),
            // UserInfoRow(label: t.name, value: t.name),
            // const SizedBox(height: 10),
            // UserInfoRow(label: t.lastname, value: t.lastname),
            // const SizedBox(height: 10),
            UserInfoRow(label: t.email, value: user.email!),
            const SizedBox(height: 30),
            // SettingsInfoRow(label: t.theme),
            // const SizedBox(height: 10),
            SettingsInfoRow(
              label: t.language,
              onPressed: () {
                _showLanguageSheet(context);
              },
            ),
            const SizedBox(height: 50),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }

  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return const ModalSheet(buttons: LanguageButtons(),);
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: false
    );
  }
}
