import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: 10),
                Text(
                  "About",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  "To discourage the waste of resources, by promoting circular economy and creating communites for trading and sharing interests.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  "Contributing",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  "So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  "Team members",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  "Artur Telo Luís"
                  "\nDomingos Manuel Ordenâ Neto"
                  "\nFrancisco Gonçalves de Sousa"
                  "\nJoão Alberto Correia Ribeiro"
                  "\nXavier Maria Pimenta Santos",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
