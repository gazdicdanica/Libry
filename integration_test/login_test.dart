import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
//import 'package:flutter_internship_2024_app/presentation/widgets/auth/auth_form.dart';
import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolWidgetTest('Successfull Login and Logout', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      //final logoutBtn = $(#logout); 

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($('Login').visible, equals(true));
      await $('Login').tap();
      await $.pump();

      expect($('Platforms').visible, equals(true));

      // await $(logoutBtn).tap();
      // await $.pump();

  });

  patrolWidgetTest('Unsuccessfull Login with empty fields', ($) async {
      
      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);

      await $.enterText(emailField, '');
      await $.enterText(passwordField, '');

      expect($('Login').visible, equals(true));
      await $('Login').tap();
      await $.pump();

      expect($('Email is not in correct format!').visible, equals(true));
      expect($('Password should contain 6 characters!').visible, equals(true));
  });


  patrolWidgetTest('Unsuccessfull Login with wrong password', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, 'agshhshs');

      expect($('Login').visible, equals(true));
      await $('Login').tap();
      await $.pump();

      expect($('Invalid email or password!').visible, equals(true));
      
  });
}


// final searchBtn = $(#search);
      // final searchField = $(#searchInputField);
      //final searchList = $(#searchList);

      // await $(searchBtn).tap();
      // await $.pump(); 

      // await $.enterText(searchField, 'kotlin');
      
      // await $.tester.sendKeyEvent(LogicalKeyboardKey.enter);

      //expect($(searchList).visible, equals(true));