import 'package:flutter/material.dart';
import '/screens/messages/components/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  static String routeName = "/messages_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
        ),
        body: const Body());
  }
}
