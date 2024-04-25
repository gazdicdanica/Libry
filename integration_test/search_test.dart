import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_internship_2024_app/keys.dart';

import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {
patrolTest('Search screen', ($) async {

    app.main();
    await $.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5));
    await $(K.emailField).enterText('test@gmail.com');
    await $(K.passwordField).enterText('testing');

    await $.scrollUntilVisible(finder: $(K.loginBtn));
    await $(K.loginBtn).tap();

    await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('NPM').visible, equals(true), reason: 'NPM is not visible before sign up/login');

    //SEARCH
    await $(K.searchBtn).tap();
    await $.pump();
    await Future.delayed(const Duration(seconds: 2));
    await $(K.searchInputField).enterText('meta');
      
    await $.tester.testTextInput.receiveAction(TextInputAction.search);
    await $.pumpAndSettle(timeout: const Duration(seconds: 15));

    await $('meta').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('meta').visible, equals(true), reason: 'Meta is not visible');

    await $(K.removeBtn).tap();

    await $.native.pressBack();
  
    await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('NPM').visible, equals(true), reason: 'NPM are not visible before sign up/login');

    await $(K.accountBtn).tap();

    //LOG OUT
    await $.scrollUntilVisible(finder: $(K.logoutBtn));
    await $(K.logoutBtn).tap();

    expect($('Yes').visible, equals(true), reason: 'Yes is not visible');
    await $('Yes').tap();

    expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');

   
  });

}