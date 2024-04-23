import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolTest('Successfull Login and change Language to Serbian and Logout', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);
      final accountBtn = $(#account);
      final logoutBtn = $(#logout); 

      await $.scrollUntilVisible(finder: loginBtn);
      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('NPM').visible, equals(true), reason: 'NPM is not visible before sign up/login');

      //ACCOUNT
      await $(accountBtn).tap();
      await $.pump();

      //CHANGE LANGUAGE
      await $.scrollUntilVisible(finder: $('change').at(1));
      await $('change').at(1).tap();
      await $.pump();

      await $('Serbian').waitUntilVisible(timeout: const Duration(seconds: 5));
      await $('Serbian').tap();
      await $.pump();

      //LOG OUT
      await $.scrollUntilVisible(finder: logoutBtn);
      await $(logoutBtn).tap();
      await $.pump();

      expect($('Da').visible, equals(true), reason: 'Da is not visible');
      await $('Da').tap();
      await $.pump();

      expect($('Dobrodošli u Libry').visible, equals(true), reason: 'Dobrodošli u Libry are not visible');

      //UNSUCCESSFULL LOGIN ON SERBIAN
      await $.enterText(emailField, '');
      await $.enterText(passwordField, '');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      expect($('Email adresa nije u dobrom formatu!').visible, equals(true), reason: 'Email error message is not visible');
      expect($('Lozinka mora da sadrži bar 6 karaktera!').visible, equals(true), reason: 'Password error message is not visible');
  });


  patrolTest('Successfull Login, change Language to Serbian, Logout, wrong password', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);
      final accountBtn = $(#account);
      final logoutBtn = $(#logout); 

      await $.scrollUntilVisible(finder: loginBtn);
      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('NPM').visible, equals(true), reason: 'NPM is not visible before sign up/login');

      //ACCOUNT
      await $(accountBtn).tap();
      await $.pump();

      //CHANGE LANGUAGE
      await $.scrollUntilVisible(finder: $('change').at(1));
      await $('change').at(1).tap();
      await $.pump();

      await $('Serbian').waitUntilVisible(timeout: const Duration(seconds: 5));
      await $('Serbian').tap();
      await $.pump();

      //LOG OUT
      await $.scrollUntilVisible(finder: logoutBtn);
      await $(logoutBtn).tap();
      await $.pump();

      expect($('Da').visible, equals(true), reason: 'Da is not visible');
      await $('Da').tap();
      await $.pump();

      expect($('Dobrodošli u Libry').visible, equals(true), reason: 'Dobrodošli u Libry are not visible');

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, '123456');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();
      expect($('Autentifikacija nije uspela! Molimo Vas pokušajte kasnije.').visible, equals(true), reason: 'Authentication error message is not visible');
  });

patrolTest('Successfull Login, change Language to Serbian, check localisation in the app and Logout', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final loginBtn = $(#login);
      final homeBtn = $(#home);
      final accountBtn = $(#account);
      final searchBtn = $(#search);
      final logoutBtn = $(#logout); 

      await $.scrollUntilVisible(finder: loginBtn);
      await $('Login').waitUntilVisible(timeout: const Duration(seconds: 5));

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($(loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
      await $(loginBtn).tap();
      await $.pump();

      await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('NPM').visible, equals(true), reason: 'NPM is not visible before sign up/login');

      //ACCOUNT
      await $(accountBtn).tap();
      await $.pump();

      //CHANGE LANGUAGE
      await $.scrollUntilVisible(finder: $('change').at(1));
      await $('change').at(1).tap();
      await $.pump();

      await $('Serbian').waitUntilVisible(timeout: const Duration(seconds: 5));
      await $('Serbian').tap();
      await $.pump();

      //BACK TO HOME SCREEN
      await $(homeBtn).tap();
      await $.pump();

      await $('Platforme').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('Platforme').visible, equals(true), reason: 'Platforme is not visible');

      //SEARCH SCREEN
      await $(searchBtn).tap();
      await $.pump();

      await $('Pretraga').waitUntilVisible(timeout: const Duration(seconds: 5));
      expect($('Pretraga').visible, equals(true), reason: 'Pretraga is not visible');

      await $.native.pressBack();

      await $(accountBtn).tap();
      await $.pump();

      await $.scrollUntilVisible(finder: logoutBtn);

      await $(logoutBtn).tap();
      await $.pump();

      expect($('Da').visible, equals(true), reason: 'Da is not visible');
      await $('Da').tap();
      await $.pump();
});

}