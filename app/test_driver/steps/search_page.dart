import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapWidget extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    String email = 'arturtelo88@hotmail.com';
    String password = '123456';

    final emailField = find.byValueKey('email');
    final passwordField = find.byValueKey('password');
    final loginButton = find.byValueKey('login');

    await FlutterDriverUtils.tap(world.driver, emailField);
    await world.driver!.enterText(email);
    await FlutterDriverUtils.tap(world.driver, passwordField);
    await world.driver!.enterText(password);
    await FlutterDriverUtils.tap(world.driver, loginButton);

    await FlutterDriverUtils.waitForFlutter(world.driver);

    final searchField = find.byValueKey('search');

    await FlutterDriverUtils.tap(world.driver, searchField);
  }

  @override
  RegExp get pattern => RegExp(r"the {string} screen");
}