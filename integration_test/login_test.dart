//@Timeout(Duration(days: 1))

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
//import 'package:flutter_internship_2024_app/presentation/widgets/auth/auth_form.dart';

import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolWidgetTest('Successfull Login', ($) async {

      app.main();
      await $.pumpAndSettle();

      final emailField = $(#email);
      final passwordField = $(#password);
      final logoutBtn = $(#logout); 
      final searchBtn = $(#search);
      final searchField = $(#searchInputField);
      //final searchList = $(#searchList);

      await $.enterText(emailField, 'test@gmail.com');
      await $.enterText(passwordField, 'testing');

      expect($('Login').visible, equals(true));
      await $('Login').tap();
      await $.pump();

      expect($('Platforms').visible, equals(true));

      await $(searchBtn).tap();
      await $.pump(); 

      await $.enterText(searchField, 'kotlin');
      
      await $.tester.sendKeyEvent(LogicalKeyboardKey.enter);

     
      
      

      //expect($(searchList).visible, equals(true));


      // await $(logoutBtn).tap();
      // await $.pump();

  });
}