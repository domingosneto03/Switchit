import 'package:flutter/material.dart';
import 'package:switchit/screens/followers/followers_screen.dart';
import 'package:switchit/screens/messages/message_screen.dart';
import 'package:switchit/screens/messages/messages_screen.dart';
import '../screens/followers/following_screen.dart';
import '../screens/signup/view/signup_screen.dart';
import '../screens/credits/credits_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  CreditsScreen.routeName: (context) => const CreditsScreen(),
  MessagesScreen.routeName: (context) => const MessagesScreen(),
  MessageScreen.routeName: (context) => const MessageScreen(),
  FollowersScreen.routeName: (context) => const FollowersScreen(),
  FollowingScreen.routeName: (context) => const FollowingScreen(),
};
