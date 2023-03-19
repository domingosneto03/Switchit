import 'package:flutter/material.dart';
import 'package:switchit/network/network_controller.dart';
import 'package:switchit/ui/signup/signup_screen.dart';
import '../../components/textfield_default.dart';
import '../../components/square_tile.dart';
import '/ui/home/home_screen.dart';
import '../../components/button_default.dart';

class Body extends StatelessWidget {
  Body({super.key});

  String? email;
  String? password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signUserIn(BuildContext context) async {
    var result = await NetworkController.login(email ?? "", password ?? "");

    if (result == LoginStatus.success) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (Route<dynamic> route) => false,
      );
    } else if (result == LoginStatus.wrongPassword) {
      debugPrint("Show error to the user");
    } else if (result == LoginStatus.userNotFound) {
      debugPrint("Show error to the user");
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
                        'Login Account',
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
                    'Sign in to continue!',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 4, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Remember Me',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            ButtonDefault(
                name: "Sign In",
                onTap: () {
                  signUserIn(context);
                }),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SquareTile(imagePath: 'assets/images/google.png'),
                SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignupScreen.routeName);
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
