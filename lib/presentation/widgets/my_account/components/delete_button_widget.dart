import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_internship_2024_app/data/auth/data_provider/auth_data_provider.dart';
import 'package:flutter_internship_2024_app/data/auth/repository/auth_repository.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/custom_dialog_widget.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/my_account/components/password_input_dialog.dart';
import 'package:flutter_internship_2024_app/theme.dart';
import 'package:flutter_internship_2024_app/keys.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    return RepositoryProvider(
      create: (context) => AuthRepository(AuthDataProvider()),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthDeletionFailure) {
              messenger.showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is DeleteLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ReauthenticationNeeded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PasswordInputDialog(
                        user: user,
                      );
                    });
              });
            }
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
                  if (context.mounted) _deleteAccount(context);
                }
              },
              child: Text(
                key: K.deleteBtn,
                t.delete_account,
                style: const TextStyle(color: darkGreenColor, fontSize: 15),
              ),
            );
          },
        ),
      ),
    );
  }

  void _deleteAccount(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(DeleteAccount(user));
  }
}
