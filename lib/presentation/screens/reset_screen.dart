import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/presentation/screens/auth_screen.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/auth/reset_form.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Positioned(
            top:50,
            left: 20,
            child:IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(MaterialPageRoute(
                  builder: (context) => const AuthScreen(),
                ));})
            ),
           Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Forgot your password?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                 const  ResetForm(),
                 ],
              ),
            ),
          ),
        ),]
      ),
    );
  }
}
