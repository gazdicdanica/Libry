import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/auth/form_field.dart';

class ResetForm extends StatefulWidget {
  const ResetForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ResetFormState();
  }
}

class _ResetFormState extends State<ResetForm> {
  final _resetForm = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  var _messageSend = false;
  String? errorMessage;
  String? emailError = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail(String email) {
    if (email.isEmpty || !EmailValidator.validate(email)) {
      setState(() {
        emailError = t.email_format_error;
      });
    } else {
      setState(() {
        emailError = '';
      });
    }
  }

  void _sendResetEmail(BuildContext context) {
    _validateEmail(_emailController.text.trim());
    if (emailError == '') {
      BlocProvider.of<AuthBloc>(context).add(SendResetEmail(
        email: _emailController.text.trim(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            setState(() {
              _messageSend = true;
            });
          }
          if (state is ForgotPasswordFailure) {
            setState(() {
              _messageSend = true;
              errorMessage = state.emailError;
            });
          }
        },
        builder: (context, state) {
          return Form(
            key: _resetForm,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  if (!_messageSend)
                    Column(children: [
                      Text(
                        textAlign: TextAlign.center,
                        t.reset_password_title,
                        style: TextStyle(
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontWeight),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomFormField(
                        controller: _emailController,
                        labelText: t.email,
                        hintText: t.email_hint,
                        errorText: (emailError != '') ? emailError : null,
                        suffixIcon:
                            (emailError != '') ? const Icon(Icons.error) : null,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _sendResetEmail(context);
                          },
                          style: Theme.of(context).textButtonTheme.style!,
                          child: Text(
                            t.reset_password_btn,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ]),
                  if (_messageSend)
                    Column(children: [
                      Text(
                          textAlign: TextAlign.center,
                          t.reset_password_success,
                          style: TextStyle(
                              color: const Color.fromRGBO(72, 75, 73, 1),
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontWeight)),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(MaterialPageRoute(
                                  builder: (context) => const AuthScreen()));
                            },
                            style: Theme.of(context).textButtonTheme.style!,
                            child: Text(
                              t.go_back,
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      (state is ForgotPasswordFailure)
                          ? Text(
                              t.confirm_password_error,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            )
                          : const SizedBox(),
                    ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
