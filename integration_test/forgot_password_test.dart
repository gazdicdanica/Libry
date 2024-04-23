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

      await $(resetBtn).tap();
      await $.pump();

      expect($(resetMessage).visible, equals(true), reason: 'Reset message is not visible');
      
      await $(goBackBtn).tap();
      await $.pump();

      expect($('Welcome to Libry').visible, equals(true), reason: 'Welcome to Libry are not visible');

  });
}