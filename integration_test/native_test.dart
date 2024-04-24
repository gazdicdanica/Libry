import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_internship_2024_app/keys.dart';

import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolTest('OS Dark theme on', ($) async {

    await $.native.enableDarkMode();

    app.main();
    await $.pumpAndSettle();

    await $('Welcome to Libry').waitUntilVisible(timeout: const Duration(seconds: 5));

  });

  patrolTest('Turn off Wi-Fi connection before we login', ($) async {

    app.main();
    await $.pumpAndSettle();

    final logoutBtn = $(#logout);

    await $(K.loginBtn).waitUntilVisible(timeout: const Duration(seconds: 5));

    await $(K.emailField).enterText('test@gmail.com');
    await $(K.passwordField).enterText('testing');

    //await $.native.enterTextByIndex('test4@gmail.com', index: 0); // enter username
    // await $.native.enterTextByIndex('testing', index: 1); // enter password

    //await $.native.disableWifi();
    await $.native.disableCellular();

    await $(K.loginBtn).tap();
    await $.pump();

    await $('No internet connection.').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('No internet connection.').visible, equals(true), reason: 'No internet connection is not visible');

    await $.native.enableCellular();

    await $(K.reloadBtn).waitUntilVisible(timeout: const Duration(seconds: 10));
    await $(K.reloadBtn).tap();
    await $.pump();

    await $('Platforms').waitUntilVisible(timeout: const Duration(seconds: 5));
    expect($('Platforms').visible, equals(true), reason: 'Platforms are not visible before sign up/login');

    await $(K.accountBtn).tap();
    await $.pump();

    //LOG OUT
    await $.scrollUntilVisible(finder: logoutBtn);
    await $(K.logoutBtn).tap();
    await $.pump();

    expect($('Yes').visible, equals(true), reason: 'Yes is not visible');
    await $('Yes').tap();
    await $.pump();

    expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');

  });

  patrolTest('Search screen', ($) async {

    app.main();
    await $.pumpAndSettle();

    final loginBtn = $(#login);
    final logoutBtn = $(#logout);

    await $(K.emailField).enterText('test@gmail.com');
    await $(K.passwordField).enterText('testing');

    await $.scrollUntilVisible(finder: loginBtn);
    await $(K.loginBtn).tap();
    await $.pump();

    await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('NPM').visible, equals(true), reason: 'NPM is not visible before sign up/login');


    //SEARCH???
    await $(K.searchBtn).tap();
    await $.pump();
    await Future.delayed(const Duration(seconds: 2));
    await $(K.searchInputField).enterText('meta');
      

    await $('meta').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('meta').visible, equals(true), reason: 'Meta is not visible');

    await $(K.removeBtn).tap();
    await $.pump();

    await $.native.pressBack();
  
    await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('NPM').visible, equals(true), reason: 'NPM are not visible before sign up/login');

    await $(K.accountBtn).tap();
    await $.pump();

    //LOG OUT
    await $.scrollUntilVisible(finder: logoutBtn);
    await $(K.logoutBtn).tap();
    await $.pump();

    expect($('Yes').visible, equals(true), reason: 'Yes is not visible');
    await $('Yes').tap();
    await $.pump();

    expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');

   
  });

}