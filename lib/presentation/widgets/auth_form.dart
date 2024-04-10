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
  final _passwordController = TextEditingController();

  void _authenticate(){
    final isValid = _form.currentState!.validate();
    if(!isValid){
      return;
    }
  }

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
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !EmailValidator.validate(value)) {
                return 'Email is not in correct format!';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          // password
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Your password',
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty || value.length < 6) {
                return 'Password should contain 6 characters!';
              }
              return null;
            },
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
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(0, 166, 141, 1))),
                    child: const Text('Forgot your password?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Repeat your password',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: true,
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value != _passwordController.text) {
                      return 'Passwords do not match!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          // confirm password
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _authenticate,
              style: buttonStyle,
              child: Text(_isLogin ? 'Login' : 'Sign up'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _form.currentState!.reset();
                  _isLogin = !_isLogin;
                });
              },
              style: buttonStyle,
              child: Text(_isLogin ? 'Sign up' : 'Login'),
            ),
          ),
        ],
      ),
    );
  }
}
