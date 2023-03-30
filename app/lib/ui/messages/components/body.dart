import 'package:flutter/material.dart';
import 'package:switchit/ui/messages/message_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  GestureDetector buildInbox(String name, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MessageScreen.routeName);
      },
      child: Container(
        alignment: Alignment.topLeft,
        height: 90,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4,
          ),
          color: const Color.fromRGBO(124, 90, 181, 1),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 10),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              child: const Icon(Icons.person, color: Colors.deepPurple, size: 70),
            ),
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 5),
          children: [
            buildInbox("venâncio", context),
            buildInbox("venâncio", context),
            buildInbox("venâncio", context),
            buildInbox("venâncio", context),
            buildInbox("venâncio", context),
            buildInbox("venâncio", context),
            buildInbox("venâncio", context),
            buildInbox("venâncio", context),
            buildInbox("aurélio", context),
            buildInbox("marcelo", context)
          ],
        ),
      ),
    );
  }
}
