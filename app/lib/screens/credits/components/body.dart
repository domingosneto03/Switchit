import 'package:flutter/material.dart';
import 'package:switchit/screens/credits/components/name_card.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final Map artur = {
    'name': 'Artur Telo',
    'up_id': 'up202000000',
    'image': 'assets/images/artur.jpg'
  };
  final Map xavier = {
    'name': 'Xavier Santos',
    'up_id': 'up202000000',
    'image': 'assets/images/xavier.jpg'
  };
  final Map francisco = {
    'name': 'Francisco Sousa',
    'up_id': 'up202000000',
    'image': 'assets/images/francisco.jpg'
  };
  final Map domingos = {
    'name': 'Domingos Neto',
    'up_id': 'up202000000',
    'image': 'assets/images/domingos.jpg'
  };
  final Map joao = {
    'name': 'João Ribeiro',
    'up_id': 'up201305891',
    'image': 'assets/images/joao.jpg'
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Switchit\'s Vision',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                textAlign: TextAlign.center,
                'To discourage the waste of resources, by promoting circular economy and creating communities for trading and sharing interests.',
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Collaboration',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                'So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        NameCard(
          param: artur,
        ),
        NameCard(
          param: xavier,
        ),
        NameCard(
          param: francisco,
        ),
        NameCard(
          param: domingos,
        ),
        NameCard(
          param: joao,
        ),
      ],
    );
  }
}
