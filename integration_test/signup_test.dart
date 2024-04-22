import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
//import 'package:flutter_internship_2024_app/presentation/widgets/auth/auth_form.dart';
import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

//group('Sign in group of tests', () { 
  patrolTest('Successfull Sign up and Logout', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final confirmPasswordField = $(#confirmPassword);
      final accountBtn = $(#account);
      final logoutBtn = $(#logout); 

      //SIGN UP
      await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 5));

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();
      await $.pump();

      await $.enterText(emailField, 'test4@gmail.com');
      await $.enterText(passwordField, 'testing');
      await $.enterText(confirmPasswordField, 'testing');

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();
      await $.pump();

      await $('Platforms').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('Platforms').visible, equals(true), reason: 'Platforms are not visible before sign up/login');

      //ACCOUNT
      await $(accountBtn).tap();
      await $.pump();

      //LOG OUT
      await $(logoutBtn).tap();
      await $.pump();

      expect($('Yes').visible, equals(true), reason: 'Yes is not visible');
      await $('Yes').tap();
      await $.pump();

      expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');
  });


  patrolTest('Unsuccessfull Sign up - all empty fields', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final confirmPasswordField = $(#confirmPassword);

      await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 5));

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();
      await $.pump();

      await $.enterText(emailField, '');
      await $.enterText(passwordField, '');
      await $.enterText(confirmPasswordField, '');

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();
      await $.pump();

      expect($('Email is not in correct format!').visible, equals(true), reason: 'Email error message is not visible');
      expect($('Password should contain 6 characters!').visible, equals(true), reason: 'Password error message is not visible');
      expect($('Passwords do not match!').visible, equals(true), reason: 'Confirm password error message is not visible');

  });


  patrolTest('Unsuccessfull Sign up - invalid input fields', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final confirmPasswordField = $(#confirmPassword);

      await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 5));

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();
      await $.pump();

      await $.enterText(emailField, 'testt.com');
      await $.enterText(passwordField, '123');
      await $.enterText(confirmPasswordField, '12');

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();
      await $.pump();

      expect($('Email is not in correct format!').visible, equals(true), reason: 'Email error message is not visible');
      expect($('Password should contain 6 characters!').visible, equals(true), reason: 'Password error message is not visible');
      expect($('Passwords do not match!').visible, equals(true), reason: 'Confirm password error message is not visible');
  });

//});
}