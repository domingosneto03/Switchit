import 'package:flutter/material.dart';
import 'package:switchit/app/routes.dart';
import 'package:switchit/network/network_auth_controller.dart';
import 'package:switchit/network/network_controller.dart';
import 'package:switchit/screens/home/home_screen.dart';
import 'package:switchit/screens/login/view/login_screen.dart';

import 'package:switchit/app/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NetworkController.init();

  if (await NetworkAuthController.isUserAuthenticated()) {
    debugPrint('User is signed in!');

    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Switchit',
        theme: ThemeData(
          primarySwatch: colorPrimary,
        ),
        routes: routes,
        home: const HomeScreen()));
  } else {
    debugPrint('User is currently signed out!');

    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Switchit',
      theme: ThemeData(
        primarySwatch: colorPrimary,
      ),
      routes: routes,
      home: const LoginScreen(),
    ));
  }
}
