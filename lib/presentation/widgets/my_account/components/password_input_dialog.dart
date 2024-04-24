import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_internship_2024_app/data/auth/data_provider/auth_data_provider.dart';
import 'package:flutter_internship_2024_app/data/auth/repository/auth_repository.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class PasswordInputDialog extends StatefulWidget {
  const PasswordInputDialog({super.key, required this.user});

  final User user;

  @override
  State<StatefulWidget> createState() {
    return _PasswordInputDialogState();
  }
}

class _PasswordInputDialogState extends State<PasswordInputDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return RepositoryProvider(
      create: (context) => AuthRepository(AuthDataProvider()),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ReauthLoading) {
              print("auth: ReauthLoading reuth");
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ReauthenticationSuccess) {
              print("auth: ReauthenticationSuccess");
              if (context.mounted) _deleteAccount(context);
              Navigator.pop(context);
            } else if (state is ReauthenticationFailure) {
              print("auth: ReauthenticationFailure");
              _errorMessage = state.errorMessage;
            } else {
              _errorMessage = null;
            }

            return AlertDialog(
              title: Text(t.reauthenticate),
              content: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(t.enter_password),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: t.password,
                        labelStyle: const TextStyle(color: darkGreenColor),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: darkGreenColor),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: darkGreenColor),
                        ),
                      ),
                      onChanged: (_) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.password_error;
                        }
                        if (value.length < 6) {
                          return t.password_error;
                        }
                        return null;
                      },
                    ),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 13),
                      ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _reauthenticate(context, _passwordController.text);
                    }
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
          },
        ),
      ),
    );
  }

  void _deleteAccount(BuildContext context) {
    print("auth: _deleteAccount reuth");
    BlocProvider.of<AuthBloc>(context).add(DeleteAccount(widget.user));
  }

  void _reauthenticate(BuildContext context, String password) {
    print("auth: _reauthenticate reuth");
    BlocProvider.of<AuthBloc>(context)
        .add(Reauthenticate(widget.user, password));
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
