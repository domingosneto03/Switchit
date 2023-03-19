import 'package:flutter/material.dart';
import 'package:switchit/ui/messages/message_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, MessageScreen.routeName);
              },
              child: Container(
                alignment: Alignment.topLeft,
                child: Text("Constâncio", style: TextStyle(color: Colors.white, fontSize: 20),),
                height: 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}