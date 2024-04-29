import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_internship_2024_app/keys.dart';
import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolTest('Presentation Patrol test', ($) async {

    //NATIVE
    await $.native.disableDarkMode();

    //APP INITIALIZATION
    app.main();
    await $.pumpAndSettle();

    //ONBOARDING SLIDES
    // await $('Skip').waitUntilVisible(timeout: const Duration(seconds: 15));
    // await $('Skip').tap();
    await $.scrollUntilVisible(finder: $('Sign up'));

    //await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 15));
    await $('Sign up').tap();

    //LOGIN FLOW
    await $(K.loginBtn).waitUntilVisible(timeout: const Duration(seconds: 15));

    expect($(K.loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');

    await $(K.emailField).enterText('milos@gmail.com');
    await $(K.passwordField).enterText('testing');

    expect($(K.loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
    await $(K.loginBtn).tap();

    await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('NPM').visible, equals(true), reason: 'NPM are not visible before sign up/login');

    //SCROLL
    await $.scrollUntilVisible(finder: $('CPAN'));

    //SEARCH
    await $(K.searchBtn).tap();
    await Future.delayed(const Duration(seconds: 2));
    await $(K.searchInputField).enterText('perl');
      
    await $.tester.testTextInput.receiveAction(TextInputAction.search);
    await $.pumpAndSettle(timeout: const Duration(seconds: 15));

    await $('Perl-Version').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('Perl-Version').visible, equals(true), reason: 'Meta is not visible');

    await $('Perl-Version').tap();
    expect($('Library details').visible, equals(true), reason: 'Library details is not visible');

    await $(K.favorite).tap();
    await $('Package added to favorites').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('Package added to favorites').visible, equals(true), reason: 'Package is not visible');

    expect($(K.webView).visible, equals(true), reason: 'Web view is not visible');

    await Future.delayed(const Duration(seconds: 1));
    await $.native.pressBack();

    await $(K.removeBtn).tap();
    
    await $.native.pressBack();
  
    await $('CPAN').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('CPAN').visible, equals(true), reason: 'CPAN are not visible before sign up/login');

    await $(K.favoritesBtn).tap();
    await $(K.removeFav).tap();

    await $('Package removed from favorites').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('Package removed from favorites').visible, equals(true), reason: 'Package is not visible');

    //ACCOUNT SCREEN, THEME, LANGUAGE CHANGE, DELETE ACCOUNT
    await $(K.accountBtn).tap();

    await $(K.changeTheme).tap();

    await $('Dark theme').waitUntilVisible(timeout: const Duration(seconds: 5));
    await $('Dark theme').tap();
    await Future.delayed(const Duration(seconds: 1));

    await $.scrollUntilVisible(finder: $('change').at(1));
    await $('change').at(1).tap();

    await $('Serbian').waitUntilVisible(timeout: const Duration(seconds: 5));
    await $('Serbian').tap();
    await Future.delayed(const Duration(seconds: 1));

    await $.scrollUntilVisible(finder: $('Obriši nalog'));
    await $(K.deleteBtn).waitUntilVisible(timeout: const Duration(seconds: 5));
    await $(K.deleteBtn).tap();

    expect($('Da').visible, equals(true), reason: 'Da is not visible');
    await $('Da').tap();

    await Future.delayed(const Duration(seconds: 3));
    expect($('Welcome to Libry!').visible, equals(true), reason: 'Welcome to Libry! is not found before accessing Sign up form');

  });
 
}