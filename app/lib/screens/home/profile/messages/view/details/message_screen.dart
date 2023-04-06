import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/messages/view/details/components/body.dart';

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
