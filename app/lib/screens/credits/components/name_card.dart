import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  const NameCard({Key? key, required this.param}) : super(key: key);

  final Map param;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Image.asset(param['image'],
          ),
          ListTile(
            title: Text(param['name']),
            subtitle: Text(param['up_id']),
          )
        ],

      ),
    );
  }
}
