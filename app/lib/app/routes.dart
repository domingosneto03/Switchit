import 'package:flutter/material.dart';
import 'package:switchit/screens/forgot_password/view/forgot_password_screen.dart';
import 'package:switchit/screens/home/home_screen.dart';
import 'package:switchit/screens/login/view/login_screen.dart';
import 'package:switchit/screens/home/profile/messages/view/details/message_screen.dart';
import 'package:switchit/screens/signup/view/signup_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  MessageScreen.routeName: (context) => const MessageScreen(),
};
