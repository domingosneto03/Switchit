import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:switchit/screens/forgot_password/view/forgot_password_screen.dart';
import 'package:switchit/screens/login/view_model/login_view_model.dart';
import 'package:switchit/screens/signup/view/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';
import 'package:switchit/util/ui/components/textfield_default.dart';
import 'package:switchit/screens/home/home_screen.dart';
import 'package:switchit/util/ui/components/button_default.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = context.watch<LoginViewModel>();

    return SingleChildScrollView(
      child: SafeArea(
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
                  viewModel.email = text;
                },
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldDefault(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                hintText: 'Password',
                onChanged: (text) {
                  viewModel.password = text;
                },
                obscureText: true,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 4, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Remember Me',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: viewModel.isRemembered,
                      onChanged: (bool value) {
                        setState(() {
                          viewModel.isRemembered = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              ButtonDefault(
                  name: "Sign In",
                  onTap: () {
                    _submit(context, viewModel);
                  }),
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
      ),
    );
  }

  Future<void> _submit(BuildContext context, LoginViewModel viewModel) async {
    final loading = ProgressHUD.of(context);
    loading?.show();

    await viewModel.login();

    switch (viewModel.status) {
      case StatusView.intial:
        loading?.dismiss();
        break;
      case StatusView.inProgress:
        loading?.show();
        break;
      case StatusView.messageToShow:
        loading?.dismiss();

        setState(() {
          showAlertDialog(
              context: context,
              title: "Alert",
              message: viewModel.message,
              cancelActionText: null,
              defaultActionText: "Ok",
              onDefaultActionPressed: () {});
        });
        break;
      case StatusView.done:
        loading?.dismiss();

        setState(() {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (Route<dynamic> route) => false,
          );
        });
        break;
    }
  }
}
