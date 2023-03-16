import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext buildContext) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      "vamus magna lacus, lobortis vitae erat ut, tincidunt elementum orci. Etiam metus ligula, feugiat ac ex pellentesque, porta sodales risus. Mauris sit amet eros eu velit condimentum sodales. Donec tincidunt molestie pulvinar. Donec accumsan ut mauris at lacinia. Suspendisse potenti. ",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    constraints: BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  constraints: BoxConstraints(minWidth: 50),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                  Container(
                    child: Text(
                      ". ",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    constraints: BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey,
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  constraints: BoxConstraints(minWidth: 50),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(
                    "funciona com vários tamanhos",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  constraints: BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  constraints: BoxConstraints(minWidth: 50),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(
                    "foi o que ela disse lol",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  constraints: BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  constraints: BoxConstraints(minWidth: 50),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhhhhhhhhgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  constraints: BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  constraints: BoxConstraints(minWidth: 50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
