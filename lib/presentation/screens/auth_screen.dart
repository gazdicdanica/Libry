import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  //TODO: change to true
  var _isLogin = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_isLogin ? 'Login' : 'Sign Up', style: Theme.of(context).textTheme.titleLarge,),
                Form(
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if(value == null || value.trim().isEmpty || !EmailValidator.validate(value)){
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      // password
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Password'),
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        obscureText: true,
                        validator: (value) {
                          if(value == null || value.trim().isEmpty || value.length < 6){
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        
                        },
                      ),
                      if(!_isLogin)
                        // confirm password
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Confirm Password'),
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          obscureText: true,
                          validator: (value) {
                            
                            return null;
                          },
                        ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text(_isLogin ? 'Login' : 'Sign up'),
                      ),
                    ],
                  )
                
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}