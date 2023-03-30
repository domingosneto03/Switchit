import 'package:flutter/material.dart';
import 'package:switchit/ui/credits/components/name_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 100,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blueGrey),
                height: 100,
                width: 100,
                margin: EdgeInsets.fromLTRB(30, 60, 0, 0),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 60, 0, 0),
                    width: 300,
                    height: 25,
                    child: Text("@example_user",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    width: 300,
                    height: 75,
                    child: Text(
                      "Maecenas laoreet arcu tortor, sit amet faucibus nulla tempus eget. "
                      "Suspendisse at erat in neque tincidunt malesuada. Phasellus luctus velit est. "
                      "Quisque nisl arcu, eleifend at commodo non, sollicitudin non nisi. "
                      "Ut tempus, magna vel faucibus dapibus, lacus neque pulvinar "
                      "justo, ac feugiat arcu duis.",
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            child: Text(''),
            height: 100,
          ),
          Column(
            children: [
              Wrap(
                runSpacing: 5,
                children: [
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      child: Text(
                        "Items for Trade",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      height: 35,
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      child: Text(
                        "My Favourites",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      height: 35,
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      child: Text(
                        "Messages",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      height: 35,
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      child: Text(
                        "Followers/Following",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      height: 35,
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      child: Text(
                        "Privacy Settings",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      height: 35,
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      child: Text(
                        "Account Settings",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      height: 35,
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      child: Text(
                        "Delete Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      height: 35,
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
