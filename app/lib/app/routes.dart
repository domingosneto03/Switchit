import 'package:flutter/material.dart';
import '/ui/credits/credits_screen.dart';
import '/ui/home/home_screen.dart';
import '/ui/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  CreditsScreen.routeName: (context) => const CreditsScreen(),
};
