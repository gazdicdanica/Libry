import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/theme.dart';

final buttonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(textColor),
  backgroundColor: MaterialStateProperty.all<Color>(themeSeedColor),
  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
  elevation: MaterialStateProperty.all(5),
);

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _form = GlobalKey<FormState>();
  //TODO: change to true
  var _isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: [
          //email
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Your email address',
                border: OutlineInputBorder()),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !EmailValidator.validate(value)) {
                return 'Email is not in correct format';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          // password
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Your password',
                border: OutlineInputBorder()),
            keyboardType: TextInputType.text,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty || value.length < 6) {
                return 'Password should contain 6 characters';
              }
              return null;
            },
          ),
          if (!_isLogin)
            const SizedBox(
              height: 20,
            ),
          // confirm password
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Repeat your password',
                border: OutlineInputBorder()),
            keyboardType: TextInputType.text,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              
              onPressed: () {},
              style: buttonStyle,
              child: Text(_isLogin ? 'Login' : 'Sign up'),
            ),
          ),
        ],
      ),
    );
  }
}
