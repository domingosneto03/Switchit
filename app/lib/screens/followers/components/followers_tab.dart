import 'package:flutter/material.dart';

class FollowersTab extends StatefulWidget {
  const FollowersTab({Key? key}) : super(key: key);

  @override
  State<FollowersTab> createState() => _FollowersTabState();
}

class _FollowersTabState extends State<FollowersTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Image.asset('assets/images/user_icon.png'),
            title: const Text("Constâncio"),
            trailing: TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.white;
                    }
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.deepPurple;
                    }
                    return null;
                  }),),
              onPressed: () {},
              child: const Text(
                "Follow",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
