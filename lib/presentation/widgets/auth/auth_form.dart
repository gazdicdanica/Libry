import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/data/auth/data_provider/auth_data_provider.dart';
import 'package:flutter_internship_2024_app/data/auth/repository/auth_repository.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/screens/reset_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/auth/form_field.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _form = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return RepositoryProvider(
      create: (context) => AuthRepository(AuthDataProvider()),
      child: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) => {
            if (state is AuthUnknownFailure) {_showSnackbar(state.errorMessage)}
          },
          builder: (ctx, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Form(
              key: _form,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    if (state is AuthCredentialsFailure)
                      Text(
                        state.errorMessage,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 151, 10, 0)),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    //email
                    CustomFormField(
                      controller: _emailController,
                      labelText: t.email,
                      hintText: t.email_hint,
                      errorText: (state is AuthValidationFailure)
                          ? state.emailError
                          : null,
                      suffixIcon: (state is AuthValidationFailure &&
                              state.emailError != null)
                          ? const Icon(Icons.error)
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      controller: _passwordController,
                      labelText: t.password,
                      hintText: t.password_hint,
                      errorText: (state is AuthValidationFailure)
                          ? state.passwordError
                          : null,
                      suffixIcon: (state is AuthValidationFailure &&
                              state.passwordError != null)
                          ? const Icon(Icons.error)
                          : null,
                      obscureText: true,
                    ),

                    if (_isLogin)
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ResetScreen(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                  foregroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromRGBO(0, 166, 141, 1))),
                              child: Text(
                                t.forgot_password,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),

                    if (!_isLogin)
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            controller: _confirmPasswordController,
                            labelText: t.confirm_password,
                            hintText: t.confirm_password_hint,
                            errorText: (state is AuthValidationFailure)
                                ? state.confirmPasswordError
                                : null,
                            suffixIcon: (state is AuthValidationFailure &&
                                    state.confirmPasswordError != null)
                                ? const Icon(Icons.error)
                                : null,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _validateAndAuthenticate(ctx);
                        },
                        style: Theme.of(context).textButtonTheme.style,
                        child: Text(_isLogin ? t.login : t.singup),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _resetForm(ctx);
                        },
                        style: Theme.of(context).textButtonTheme.style,
                        child: Text(_isLogin ? t.singup : t.login),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSnackbar(String message, {int dur = 3}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: Duration(seconds: dur),
    ));
  }

  void _resetForm(BuildContext context) {
    _form.currentState!.reset();

    BlocProvider.of<AuthBloc>(context).add(ResetAuth());
    setState(() {
      _isLogin = !_isLogin;
    });
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  void _validateAndAuthenticate(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(ValidateAuth(
        isLogin: _isLogin,
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        confirmPassword: _confirmPasswordController.text.trim()));
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
