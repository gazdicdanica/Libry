import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

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

    // final emailField = $(#email);
    // final passwordField = $(#password);
    final loginBtn = $(#login);
    final reloadBtn = $(#reload);

    await $(loginBtn).waitUntilVisible(timeout: const Duration(seconds: 5));

    // await $.enterText(emailField, 'test4@gmail.com');
    // await $.enterText(passwordField, 'testing');

    await $.native.enterTextByIndex('test4@gmail.com', index: 0); // enter username
    await $.native.enterTextByIndex('testing', index: 1); // enter password

    await $.native.disableCellular();

    await $(loginBtn).tap();
    await $.pump();

    await $('No internet connection.').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('No internet connection.').visible, equals(true), reason: 'No internet connection is not visible');

    await $.native.enableCellular();

    await $(reloadBtn).tap();
    await $.pump();

    await $('Platforms').waitUntilVisible(timeout: const Duration(seconds: 5));
    expect($('Platforms').visible, equals(true), reason: 'Platforms are not visible before sign up/login');

  });

}