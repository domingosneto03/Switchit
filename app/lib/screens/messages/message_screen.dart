import 'package:flutter/material.dart';
import '/screens/messages/components/message_body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  static String routeName = "/message_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Constâncio'),
        ),
        body: const Body());
  }
}
