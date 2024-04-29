import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_internship_2024_app/keys.dart';
//import 'package:flutter_internship_2024_app/presentation/widgets/auth/auth_form.dart';
import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolTest('Successfull Sign up and Logout', ($) async {

      app.main();
      await $.pumpAndSettle(); 

      //SIGN UP
      await $.scrollUntilVisible(finder: $('Sign up'));

      await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 5));

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();

      await $(K.emailField).enterText('milos@gmail.com');
      await $(K.passwordField).enterText('testing');
      await $(K.confirmPasswordField).enterText('testing');

      //SCROLLABLE
      await $.scrollUntilVisible(finder: $('Sign up'));
      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();

      await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 20));
      expect($('NPM').visible, equals(true), reason: 'NPM are not visible before sign up/login');

      //ACCOUNT
      await $(K.accountBtn).tap();

      //LOG OUT
      await $.scrollUntilVisible(finder: $(K.logoutBtn));
      await $(K.logoutBtn).tap();

      expect($('Yes').visible, equals(true), reason: 'Yes is not visible');
      await $('Yes').tap();

      expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');
  });


  patrolTest('Unsuccessfull Sign up - all empty fields', ($) async {

      app.main();
      await $.pumpAndSettle();

      await $.scrollUntilVisible(finder: $('Sign up'));
      await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 5));

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();

      await $(K.emailField).enterText('');
      await $(K.passwordField).enterText('');
      await $(K.confirmPasswordField).enterText('');

      await $.scrollUntilVisible(finder: $('Sign up'));
      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();

      expect($('Email is not in correct format!').visible, equals(true), reason: 'Email error message is not visible');
      expect($('Password should contain 6 characters!').visible, equals(true), reason: 'Password error message is not visible');
      expect($('Passwords do not match!').visible, equals(true), reason: 'Confirm password error message is not visible');

  });


  patrolTest('Unsuccessfull Sign up - invalid input fields', ($) async {

      app.main();
      await $.pumpAndSettle();

      await $.scrollUntilVisible(finder: $('Sign up'));
      await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 5));

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();

      await $(K.emailField).enterText('testt.com');
      await $(K.passwordField).enterText('123');
      await $(K.confirmPasswordField).enterText('12');

      await $.scrollUntilVisible(finder: $('Sign up'));
      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();

      expect($('Email is not in correct format!').visible, equals(true), reason: 'Email error message is not visible');
      expect($('Password should contain 6 characters!').visible, equals(true), reason: 'Password error message is not visible');
      expect($('Passwords do not match!').visible, equals(true), reason: 'Confirm password error message is not visible');
  });


  patrolTest('Unsuccessfull Sign up - Email already in use', ($) async {

      app.main();
      await $.pumpAndSettle();

      //SIGN UP
      await $.scrollUntilVisible(finder: $('Sign up'));

      await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 5));

      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();

      await $(K.emailField).enterText('milos@gmail.com');
      await $(K.passwordField).enterText('testing');
      await $(K.confirmPasswordField).enterText('testing');

      //SCROLLABLE
      await $.scrollUntilVisible(finder: $('Sign up'));
      expect($('Sign up').visible, equals(true), reason: 'Sign up button is not found before accessing Sign up form');
      await $('Sign up').tap();

      expect($('Email is already in use!').visible, equals(true), reason: 'Email error message is not visible');
  });

}