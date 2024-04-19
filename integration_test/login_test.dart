import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
//import 'package:flutter_internship_2024_app/presentation/widgets/auth/auth_form.dart';
import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolWidgetTest('Successfull Sign up and Logout', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final confirmPasswordField = $(#confirmPassword);
      final accountBtn = $(#account);
      //final logoutBtn = $(#logout); 

      //SIGN UP
      expect($('Sign up').visible, equals(true));
      await $('Sign up').tap();
      await $.pump();

      
      await $.enterText(emailField, 'test1@gmail.com');
      await $.enterText(passwordField, 'testing');
      await $.enterText(confirmPasswordField, 'testing');
      expect($('Platforms').visible, equals(true));

      //ACCOUNT
      await $(accountBtn).tap();
      await $.pump();
      // expect($('Account').visible, equals(true));
      // await $('Account').tap();
      // await $.pump();

      //LOG OUT
      expect($('Log out').visible, equals(true));
      await $('Log out').tap();
      await $.pump();

      expect($('Yes').visible, equals(true));
      await $('Yes').tap();
      await $.pump();

      expect($('Welcome to Libry').visible, equals(true));
      




      // await $(logoutBtn).tap();
      // await $.pump();

  });

  // patrolWidgetTest('Unsuccessfull Login with empty fields', ($) async {
      
  //     app.main();
  //     await $.pumpAndSettle();

  //     final emailField = $(#email);
  //     final passwordField = $(#password);

  //     await $.enterText(emailField, '');
  //     await $.enterText(passwordField, '');

  //     expect($('Login').visible, equals(true));
  //     await $('Login').tap();
  //     await $.pump();

  //     expect($('Email is not in correct format!').visible, equals(true));
  //     expect($('Password should contain 6 characters!').visible, equals(true));
  // });


  // patrolWidgetTest('Unsuccessfull Login with wrong password', ($) async {

  //     app.main();
  //     await $.pumpAndSettle();

  //     final emailField = $(#email);
  //     final passwordField = $(#password);

  //     await $.enterText(emailField, 'test@gmail.com');
  //     await $.enterText(passwordField, 'agshhshs');

  //     expect($('Login').visible, equals(true));
  //     await $('Login').tap();
  //     await $.pump();

  //     expect($('Invalid email or password!').visible, equals(true));
      
  // });
}


// final searchBtn = $(#search);
      // final searchField = $(#searchInputField);
      //final searchList = $(#searchList);

      // await $(searchBtn).tap();
      // await $.pump(); 

      // await $.enterText(searchField, 'kotlin');
      
      // await $.tester.sendKeyEvent(LogicalKeyboardKey.enter);

      //expect($(searchList).visible, equals(true));