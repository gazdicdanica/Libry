import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/auth/form_field.dart';
import 'package:flutter_internship_2024_app/theme.dart';


final buttonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(textColor),
  backgroundColor: MaterialStateProperty.all<Color>(themeSeedColor),
  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
  elevation: MaterialStateProperty.all(5),
);


final _firebase = FirebaseAuth.instance;

class ResetForm extends StatefulWidget{
  const ResetForm({super.key});

  @override
  State<StatefulWidget> createState() {
   return _ResetFormState();
  }
  

}

class _ResetFormState extends State<ResetForm>{
  final _resetForm= GlobalKey<FormState>();
  final _emailController= TextEditingController();

  var _messageSend=false;
  var _emailValid=true;

  @override
  Widget build(BuildContext context) {
   return Form(
    key: _resetForm,
     child: Column(
      children: [
        if(!_messageSend)
        Column(
        children: [ 
          Text(
            textAlign: TextAlign.center,
            'Please enter your email below and we will send your a reset link.',
             style: TextStyle(fontWeight : Theme.of(context).textTheme.titleLarge?.fontWeight),
          ),
         const SizedBox(
             height: 30,
          ),
          CustomFormField(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'Your email address',
            suffixIcon: _emailValid ? null : const Icon(Icons.error),
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !EmailValidator.validate(value)) {
                setState(() {
                  _emailValid = false;
                });
                return 'Email is not in correct format!';
              }
              setState(() {
                _emailValid = true;
              });
              return null;
            },
          ),
          const SizedBox(
                  height: 30,
                ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:(){
                  _resetPassword();
              } ,
              style: buttonStyle,
              child: const Text('Send reset link',
                      style: TextStyle( fontSize: 16),),
              ),
          ),
          ]
        ),
         
        if(_messageSend)
         Column(
           children: [  Text(
            textAlign: TextAlign.center,
             'We have sent you an email with a link to reset your passwrod. Please check you emails. ',
             style: TextStyle(color:  const Color.fromRGBO(72, 75, 73, 1),
              fontWeight : Theme.of(context).textTheme.titleLarge?.fontWeight)
          ),
         const SizedBox(
             height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context)=> const AuthScreen()));
              }  ,
              style:buttonStyle,
             child: const Text('Go back.',)
            ),
          ),
      ]),
        
      ],
     ),
   );
  }
  Future<void> _resetPassword() async {
    if (_resetForm.currentState!.validate()) {
      try {
        await _firebase.sendPasswordResetEmail(email: _emailController.text.trim());
        setState(() {
          _messageSend=true;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to send reset email. Please try again later.'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}