import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/home_screen.dart';
import 'package:switchit/screens/signup/view_model/signup_view_model.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/button_default.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';
import 'package:switchit/util/ui/components/textfield_default.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel = context.watch<SignUpViewModel>();

    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
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
              const Row(
                children: [
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
                keyboardType: TextInputType.name,
                controller: nameController,
                hintText: 'Name',
                onChanged: (currentValue) {
                  viewModel.name = currentValue;
                },
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldDefault(
                keyboardType: TextInputType.name,
                controller: surnameController,
                hintText: 'Surname',
                onChanged: (currentValue) {
                  viewModel.surname = currentValue;
                },
                obscureText: false,
              ),
              const SizedBox(height: 10),
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
                  _submit(context, viewModel);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context, SignUpViewModel viewModel) async {
    final loading = ProgressHUD.of(context);
    loading?.show();

    await viewModel.signUp();

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
