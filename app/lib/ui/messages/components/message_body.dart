import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 2),
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                  ),
                  child: const Text(
                    "vamus magna lacus, lobortis vitae erat ut, tincidunt elementum orci. Etiam metus ligula, feugiat ac ex pellentesque, porta sodales risus. Mauris sit amet eros eu velit condimentum sodales. Donec tincidunt molestie pulvinar. Donec accumsan ut mauris at lacinia. Suspendisse potenti. ",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                constraints: const BoxConstraints(minWidth: 50),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            children: [
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                  ),
                  child: const Text(
                    ". ",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                constraints: const BoxConstraints(minWidth: 50),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey,
                ),
                child: const Text(
                  "funciona com vários tamanhos",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                constraints: const BoxConstraints(minWidth: 50),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.indigo,
                ),
                child: const Text(
                  "foi o que ela disse lol",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                constraints: const BoxConstraints(minWidth: 50),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey,
                ),
                child: const Text(
                  "foi o que ela disse lol",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                constraints: const BoxConstraints(minWidth: 50),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey,
                ),
                child: const Text(
                  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhhhhhhhhgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                constraints: const BoxConstraints(minWidth: 50),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.indigo,
                ),
                child: const Text(
                  "skidipopst \n"
                      "bip di boop \n"
                      "akgjhakbghwgkjhgjhqwgriiyasfmnnbn",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                constraints: const BoxConstraints(minWidth: 50),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
