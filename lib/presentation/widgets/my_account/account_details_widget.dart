import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/delete_button_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/logout_button_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/modals/language_buttons.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/modals/modal_sheet.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/modals/theme_buttons.dart';
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
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SettingsInfoRow(
                  label: t.theme,
                  subtitle: t[
                      'theme_${(state as ThemeChanged).themeMode.name.toString()}'],
                  onPressed: () {
                    _showModalSheet(context, const ThemeButtons());
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            SettingsInfoRow(
              label: t.language,
              subtitle:
                  t['language_${LocaleSettings.currentLocale.languageCode}'],
              onPressed: () {
                _showModalSheet(context, const LanguageButtons());
              },
            ),
            const SizedBox(height: 10),
            const LogoutButton(),
            const SizedBox(height: 10),
            DeleteAccountButton(user: user),
          ],
        ),
      ),
    );
  }

  void _showModalSheet(BuildContext context, Widget content) {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return ModalSheet(
            buttons: content,
          );
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        isScrollControlled: false);
  }
}
