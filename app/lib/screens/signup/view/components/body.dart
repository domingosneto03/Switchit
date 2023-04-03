import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/signup/view_model/signup_view_model.dart';
import '../../../components/button_default.dart';
import '../../../components/textfield_default.dart';
import '../../../home/home_screen.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel = context.watch<SignUpViewModel>();

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
              onChanged: (currentValue) {
                viewModel.email = currentValue;
              },
              obscureText: false,
            ),
            const SizedBox(height: 10),
            TextFieldDefault(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              hintText: 'Password',
              onChanged: (currentValue) {
                viewModel.password = currentValue;
              },
              obscureText: true,
            ),
            const SizedBox(height: 25),
            ButtonDefault(
              name: "Sign up",
              onTap: () {
                viewModel.signUpUser();

                if (viewModel.successSignUp) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
