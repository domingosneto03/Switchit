import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/forgot_password/view_model/forgot_password_view_model.dart';
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
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ForgotPasswordViewModel viewModel =
        context.watch<ForgotPasswordViewModel>();

    return SingleChildScrollView(
        child: SafeArea(
      child: Center(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 3.5))
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
                    'Enter your email to reset the password!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
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
            const SizedBox(height: 25),
            ButtonDefault(
              name: "Reset",
              onTap: () {
                _submit(context, viewModel);
              },
            )
          ],
        ),
      ),
    ));
  }

  Future<void> _submit(
      BuildContext context, ForgotPasswordViewModel viewModel) async {
    final loading = ProgressHUD.of(context);
    loading?.show();

    await viewModel.resetPassword();

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
          showAlertDialog(
              context: context,
              title: "Alert",
              message:
                  "Please check your inbox and follow the link to reset your password.",
              cancelActionText: null,
              defaultActionText: "Ok",
              onDefaultActionPressed: () {
                Navigator.pop(context);
              });
        });
        break;
    }
  }
}
