import 'package:flutter/material.dart';
import 'package:switchit/screens/home/create_event/view/components/body.dart';

class CreateEventTabScreen extends StatelessWidget {
  const CreateEventTabScreen({super.key});

  static String routeName = "/create_event_tab_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create event'),
        ),
        body: const Body());
  }
}
