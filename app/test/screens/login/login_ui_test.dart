import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:switchit/screens/login/view/login_screen.dart';
import 'package:switchit/util/ui/components/button_default.dart';
import 'package:switchit/util/ui/components/textfield_default.dart';
import 'package:switchit/screens/signup/view/signup_screen.dart';
import 'package:switchit/screens/forgot_password/view/forgot_password_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen()
};

void main() {
  testWidgets('Checking normal text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final titleFinder = find.text('Login Account');
    final descriptionFinder = find.text('Sign in to continue!');

    expect(titleFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
  });

  testWidgets('Checking fields text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final emailFinder = find.text('Email');
    final passwordFinder = find.text('Password');

    expect(emailFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
  });

  testWidgets('Checking button text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final buttonFinder = find.text('Sign In');

    expect(buttonFinder, findsOneWidget);
  });
  testWidgets('Entering email and password', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final emailTextFieldFinder = find.byType(TextField).first;
    final passwordTextFieldFinder = find.byType(TextField).last;

    await tester.enterText(emailTextFieldFinder, 'test@test.com');
    await tester.enterText(passwordTextFieldFinder, 'password');

    expect(find.text('test@test.com'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);
  });

  testWidgets('Checking button action - empty fields', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a valid email address.'), findsOneWidget);
  });

  testWidgets('Checking button action - invalid email address', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final emailField = find.ancestor(
      of: find.text('Email'),
      matching: find.byType(TextFieldDefault),
    );

    await tester.enterText(emailField, "email.com");

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a valid email address.'), findsOneWidget);
  });

  testWidgets('Checking button action - invalid password', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final emailField = find.ancestor(
      of: find.text('Email'),
      matching: find.byType(TextFieldDefault),
    );

    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFieldDefault),
    );

    await tester.enterText(emailField, "test@test.com");
    await tester.enterText(passwordField, "");

    await tester.tap(find.byType(ButtonDefault));

    await tester.pump();

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Please enter a password.'), findsOneWidget);
  });
  testWidgets('Checking Register Now navigates to signup screen',
      (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: const LoginScreen(), routes: routes));

    final onTap = find.text('Register now');
    await tester.tap(onTap);
    await tester.pumpAndSettle();

    expect(find.byType(SignupScreen), findsOneWidget);
  });

  testWidgets('Checking Forgot Password navigates to ForgotPasswordScreen',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: const LoginScreen(), routes: routes),
    );

    final onTap = find.text('Forgot Password?');
    await tester.tap(onTap);
    await tester.pumpAndSettle();

    expect(find.byType(ForgotPasswordScreen), findsOneWidget);
  });
}
