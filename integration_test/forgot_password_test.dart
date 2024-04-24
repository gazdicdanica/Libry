import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolTest('Forgot password flow', ($) async {

      app.main();
      await $.pumpAndSettle();

      final forgotPassword = $(#forgotPassword);
      final forgotMessage = $(#forgotMessage);
      final resetBtn = $(#resetLink);
      final resetMessage = $(#resetMessage);
      final goBackBtn = $(#goBack);

      await $(forgotPassword).tap();
      await $.pump();

      expect($(forgotMessage).visible, equals(true), reason: 'Forgot message is not visible');

      await $.native.enterTextByIndex('test@gmail.com', index: 0);

      await $.scrollUntilVisible(finder: resetBtn);
      await $(resetBtn).tap();
      await $.pump();

      expect($(resetMessage).visible, equals(true), reason: 'Reset message is not visible');
      
      await $.scrollUntilVisible(finder: goBackBtn);
      await $(goBackBtn).tap();
      await $.pump();

      expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');

  });


  patrolTest('Forgot password flow - invalid email', ($) async {

      app.main();
      await $.pumpAndSettle();

      final forgotPassword = $(#forgotPassword);
      final forgotMessage = $(#forgotMessage);
      final resetBtn = $(#resetLink);
      final fpbackBtn = $(#fpbackBtn);

      await $(forgotPassword).tap();
      await $.pump();

      expect($(forgotMessage).visible, equals(true), reason: 'Forgot message is not visible');

      await $.native.enterTextByIndex('test.com', index: 0);

      await $.scrollUntilVisible(finder: resetBtn);
      await $(resetBtn).tap();
      await $.pump();

      expect($('Email is not in correct format!').visible, equals(true), reason: 'Error email message is not visible');
      

      //PRESS BACK BUTTON IS NOT WORKING
      // await $.native.pressBack();

      // await $(fpbackBtn).tap();
      // await $.pump();

      // expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');

  });


  patrolTest('Forgot password flow - empty email input field', ($) async {

      app.main();
      await $.pumpAndSettle();

      final forgotPassword = $(#forgotPassword);
      final forgotMessage = $(#forgotMessage);
      final resetBtn = $(#resetLink);
      final fpbackBtn = $(#fpbackBtn);

      await $(forgotPassword).tap();
      await $.pump();

      expect($(forgotMessage).visible, equals(true), reason: 'Forgot message is not visible');

      await $.native.enterTextByIndex('', index: 0);

      await $.scrollUntilVisible(finder: resetBtn);
      await $(resetBtn).tap();
      await $.pump();

      expect($('Email is not in correct format!').visible, equals(true), reason: 'Error email message is not visible');
      
      //PRESS BACK BUTTON IS NOT WORKING
      // await $.native.pressBack();

      // await $(fpbackBtn).tap();
      // await $.pump();

      // expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');
  });
}