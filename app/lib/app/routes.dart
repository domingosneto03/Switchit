import 'dart:js';

import 'package:flutter/material.dart';
import 'package:switchit/ui/messages/message_screen.dart';
import 'package:switchit/ui/messages/messages_screen.dart';
import '/ui/credits/credits_screen.dart';
import '/ui/home/home_screen.dart';
import '/ui/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  CreditsScreen.routeName: (context) => const CreditsScreen(),
  MessagesScreen.routeName: (context) => const MessagesScreen(),
  MessageScreen.routeName: (context) => const MessageScreen(),
};
