import 'package:flutter/material.dart';
import 'package:switchit/screens/home/create_event/view/components/body.dart';

class CreateEventTabScreen extends StatelessWidget {
  const CreateEventTabScreen({super.key});

  static String routeName = "/create_event_tab_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEvent()));
              },
            ),
          ]
        ),
        body: const Body());
  }
}
