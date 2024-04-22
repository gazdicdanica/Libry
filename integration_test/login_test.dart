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

      await $.enterText(emailField, 'test4@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      await $('Platforms').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('Platforms').visible, equals(true), reason: 'Platforms are not visible before sign up/login');

      //ACCOUNT
      await $(accountBtn).tap();
      await $.pump();

      //CHANGE THEME
      await $(changeTheme).tap();
      await $.pump();

      await $('Dark theme').waitUntilVisible(timeout: const Duration(seconds: 5));
      await $('Dark theme').tap();
      await $.pump();

      //LOG OUT
      await $(logoutBtn).tap();
      await $.pump();

      expect($('Yes').visible, equals(true), reason: 'Yes is not visible');
      await $('Yes').tap();
      await $.pump();

      expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');
  });


  patrolTest('Successfull Login and change Language to Serbian and Logout', ($) async {

    app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);
      final accountBtn = $(#account);
      final logoutBtn = $(#logout); 

      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, 'test4@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      await $('Platforms').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('Platforms').visible, equals(true), reason: 'Platforms are not visible before sign up/login');

      //ACCOUNT
      await $(accountBtn).tap();
      await $.pump();

      //CHANGE LANGUAGE
      await $('change').at(1).tap();
      await $.pump();

      await $('Serbian').waitUntilVisible(timeout: const Duration(seconds: 5));
      await $('Serbian').tap();
      await $.pump();

      //LOG OUT
      await $(logoutBtn).tap();
      await $.pump();

      expect($('Da').visible, equals(true), reason: 'Da is not visible');
      await $('Da').tap();
      await $.pump();

      expect($('Dobrodošli u Libry').visible, equals(true), reason: 'Dobrodošli u Libry are not visible');
  });




}