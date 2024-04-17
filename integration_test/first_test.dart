import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  setUp(()  {
    // This code will run before each test case
    patrolWidgetTest('Initialazing the app', ($) async {
    app.main();
    $.pumpAndSettle();

});
});

patrolWidgetTest('Successfull Login and Logout', ($) async {

    await $.enterText($(#email), 'test@gmail.com');
    await $.enterText($(#password), 'testing');

    expect($('Login').visible, equals(true));
    await $('Login').tap();
    await $.pump();

    expect($('Platforms').visible, equals(true));

    await $(#logout).tap();
    await $.pump();
});

}