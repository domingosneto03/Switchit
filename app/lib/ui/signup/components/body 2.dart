import 'package:flutter/material.dart';
import 'package:switchit/network/network_controller.dart';
import '../../components/button_default.dart';
import '../../components/textfield_default.dart';
import '/ui/home/home_screen.dart';

class Body extends StatelessWidget {
  Body({super.key});

  String? email;
  String? password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signUpUser(BuildContext context) async {
    var result = await NetworkController.signUp(email ?? "", password ?? "");

    if (result == SignupStatus.success) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      debugPrint("Show generic error to the user");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 115, 0, 0),
                  child: Row(
                    children: [
                      const Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 3.5)),
                      Image.asset(
                        'assets/images/user.png',
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 5, 0, 15),
                  child: Text(
                    'Sign up to continue!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            TextFieldDefault(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              hintText: 'Email',
              onChanged: (text) {
                email = text;
              },
              obscureText: false,
            ),
            const SizedBox(height: 10),
            TextFieldDefault(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              hintText: 'Password',
              onChanged: (text) {
                password = text;
              },
              obscureText: true,
            ),
            const SizedBox(height: 25),
            ButtonDefault(
              name: "Sign up",
              onTap: () {
                signUpUser(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
