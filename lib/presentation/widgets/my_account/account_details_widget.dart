import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/logout_button_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/profile_avatar_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/user_info_widget.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ProfileAvatar(photoURL: user.photoURL),
          const SizedBox(height: 40),
          // UserInfoRow(label: t.name, value: t.name),
          // UserInfoRow(label: t.lastname, value: t.lastname),
          UserInfoRow(label: t.email, value: user.email!),
          const SizedBox(height: 30),
          // SettingsInfoRow(label: t.theme),
          // const SizedBox(height: 10),
          // SettingsInfoRow(label: t.language),
          const SizedBox(height: 50),
          const LogoutButton(),
        ],
      ),
    );
  }
}
