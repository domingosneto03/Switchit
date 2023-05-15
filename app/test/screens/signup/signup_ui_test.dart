import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:switchit/screens/signup/view/signup_screen.dart';
import 'package:switchit/util/ui/components/button_default.dart';
import 'package:switchit/util/ui/components/textfield_default.dart';

void main() {
  testWidgets('Checking normal text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    final titleFinder = find.text('Create Account');
    final descriptionFinder = find.text('Sign up to continue!');

    expect(titleFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
  });

  testWidgets('Checking fields text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    final nameFinder = find.text('Name');
    final surnameFinder = find.text('Surname');
    final emailFinder = find.text('Email');
    final passwordFinder = find.text('Password');

    expect(nameFinder, findsOneWidget);
    expect(surnameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
  });

  testWidgets('Checking button text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    final buttonFinder = find.text('Sign up');

    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('Checking button action - empty fields', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a valid name.'), findsOneWidget);
  });

  testWidgets('Checking button action - with name', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    final nameField = find.ancestor(
      of: find.text('Name'),
      matching: find.byType(TextFieldDefault),
    );

    await tester.enterText(nameField, "Name example");

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a valid surname.'), findsOneWidget);
  });

  testWidgets('Checking button action - with name, surname', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    final nameField = find.ancestor(
      of: find.text('Name'),
      matching: find.byType(TextFieldDefault),
    );

    final surnameField = find.ancestor(
      of: find.text('Surname'),
      matching: find.byType(TextFieldDefault),
    );

    await tester.enterText(nameField, "Name example");
    await tester.enterText(surnameField, "Surname example");

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a valid email address.'), findsOneWidget);
  });

  testWidgets('Checking button action - invalid email address', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    final nameField = find.ancestor(
      of: find.text('Name'),
      matching: find.byType(TextFieldDefault),
    );

    final surnameField = find.ancestor(
      of: find.text('Surname'),
      matching: find.byType(TextFieldDefault),
    );

    final emailField = find.ancestor(
      of: find.text('Email'),
      matching: find.byType(TextFieldDefault),
    );

    await tester.enterText(nameField, "Name example");
    await tester.enterText(surnameField, "Surname example");
    await tester.enterText(emailField, "email.com");

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a valid email address.'), findsOneWidget);
  });

  testWidgets('Checking button action - with name, surname, email',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    final nameField = find.ancestor(
      of: find.text('Name'),
      matching: find.byType(TextFieldDefault),
    );

    final surnameField = find.ancestor(
      of: find.text('Surname'),
      matching: find.byType(TextFieldDefault),
    );

    final emailField = find.ancestor(
      of: find.text('Email'),
      matching: find.byType(TextFieldDefault),
    );

    await tester.enterText(nameField, "Name example");
    await tester.enterText(surnameField, "Surname example");
    await tester.enterText(emailField, "email@email.com");

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a valid password (more than 5 characters).'),
        findsOneWidget);
  });

  testWidgets('Checking button action - invalid password', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignupScreen()));

    final nameField = find.ancestor(
      of: find.text('Name'),
      matching: find.byType(TextFieldDefault),
    );

    final surnameField = find.ancestor(
      of: find.text('Surname'),
      matching: find.byType(TextFieldDefault),
    );

    final emailField = find.ancestor(
      of: find.text('Email'),
      matching: find.byType(TextFieldDefault),
    );

    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFieldDefault),
    );

    await tester.enterText(nameField, "Name example");
    await tester.enterText(surnameField, "Surname example");
    await tester.enterText(emailField, "email@email.com");
    await tester.enterText(passwordField, "pass");

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a valid password (more than 5 characters).'),
        findsOneWidget);
  });
}
