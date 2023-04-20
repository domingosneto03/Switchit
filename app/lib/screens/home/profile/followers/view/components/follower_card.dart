import 'package:flutter/material.dart';

class FollowerCard extends StatefulWidget {
  const FollowerCard({Key? key}) : super(key: key);

  @override
  State<FollowerCard> createState() => _FollowerCardState();
}

class _FollowerCardState extends State<FollowerCard> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Image.asset('assets/icons/ic_user.png'),
          title: const Text("Constâncio"),
          trailing: SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(left: 15, right: 15)),
                  backgroundColor: pressed
                      ? MaterialStateProperty.all(Colors.white)
                      : MaterialStateProperty.all(Colors.deepPurple),
                  foregroundColor: pressed
                      ? MaterialStateProperty.all(Colors.deepPurple)
                      : MaterialStateProperty.all(Colors.white),
                  side: pressed
                      ? MaterialStateProperty.all(
                          const BorderSide(width: 2, color: Colors.deepPurple))
                      : MaterialStateProperty.all(const BorderSide(
                          width: 0, color: Colors.transparent))),
              child: pressed ? const Text("Following") : const Text("Follow"),
              onPressed: () {
                setState(() {
                  pressed = !pressed;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
