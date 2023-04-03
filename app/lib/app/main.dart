import 'package:flutter/material.dart';
import 'package:switchit/network/network_controller.dart';
import '../screens/home/home_screen.dart';
import '/app/routes.dart';
import '../screens/login/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NetworkController.init();

  if (await NetworkController.isUserAuthenticated()) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Switchit',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: routes,
      home: const HomeScreen(),
    ));
  } else {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Switchit',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: routes,
      home: const LoginScreen(),
    ));
  }
}
