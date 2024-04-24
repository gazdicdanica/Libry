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
    await $.scrollUntilVisible(finder: $(K.logoutBtn));
    await $(K.logoutBtn).tap();
    await $.pump();

    expect($('Yes').visible, equals(true), reason: 'Yes is not visible');
    await $('Yes').tap();
    await $.pump();

    expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');

  });
  
}