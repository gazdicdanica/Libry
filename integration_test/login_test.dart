//import 'package:flutter_internship_2024_app/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolTest('Successfull Login and change Theme to dark and Logout', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);
      final accountBtn = $(#account);
      final changeTheme = $(#changeTheme);
      final logoutBtn = $(#logout); 

      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 15));
      expect($('NPM').visible, equals(true), reason: 'NPM are not visible before sign up/login');

      //ACCOUNT
      await $(accountBtn).tap();
      await $.pump();

      //CHANGE THEME
      await $.scrollUntilVisible(finder: changeTheme);
      await $(changeTheme).tap();
      await $.pump();
      
      await $('Dark theme').waitUntilVisible(timeout: const Duration(seconds: 5));
      await $('Dark theme').tap();
      await $.pump();

      //LOG OUT
      await $.scrollUntilVisible(finder: logoutBtn);
      await $(logoutBtn).tap();
      await $.pump();

      expect($('Yes').visible, equals(true), reason: 'Yes is not visible');
      await $('Yes').tap();
      await $.pump();

      expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');
  });


  patrolTest('Unsuccessfull Login - empty input fields', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);

      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, '');
      await $.enterText(passwordField, '');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      expect($('Email is not in correct format!').visible, equals(true), reason: 'Email error message is not visible');
      expect($('Password should contain 6 characters!').visible, equals(true), reason: 'Password error message is not visible');
  });


  patrolTest('Unsuccessfull login - wrong password', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);

      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, '123456');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      expect($('Authentication failed! Please try again later!').visible, equals(true), reason: 'Authentication error message is not visible');
  });

  patrolTest('Unsuccessfull login - invalid email or password', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);

      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, 'test.com');
      await $.enterText(passwordField, '12345');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      expect($('Email is not in correct format!').visible, equals(true), reason: 'Email error message is not visible');
      expect($('Password should contain 6 characters!').visible, equals(true), reason: 'Password error message is not visible');
  });

  patrolTest('Successfull Login and scroll to some Platform and click on it', ($) async {

      await $.native.disableDarkMode();

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);
      final mpl = $(#mpl);
      final nwl = $(#nwl);
      // final accountBtn = $(#account);
      // final changeTheme = $(#changeTheme);
      // final logoutBtn = $(#logout); 

      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('NPM').visible, equals(true), reason: 'NPM are not visible before sign up/login');

      await $.scrollUntilExists(finder: $('Meteor'));
      await $('Meteor').tap();
      await $.pump();

      expect($(mpl).visible, equals(true), reason: 'MPL is not visible');
      expect($(nwl).visible, equals(true), reason: 'NWL is not visible');
  });

}