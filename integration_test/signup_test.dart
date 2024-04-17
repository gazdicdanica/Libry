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
      final logoutBtn = $(#logout);

      expect($('Sign up').visible, equals(true));
      await $('Sign up').tap();
      await $.pump();

      await $.enterText(emailField, 'test13@gmail.com');
      await $.enterText(passwordField, 'testing');
      await $.enterText(confirmPasswordField, 'testing');

      expect($('Sign up').visible, equals(true));
      await $('Sign up').tap();
      await $.pump();

      expect($('Platforms').visible, equals(true));

      await $(logoutBtn).tap();
      await $.pump();
  });
}