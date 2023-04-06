import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:switchit/app/constants.dart';
import 'package:switchit/screens/home/profile/credits/view/credits_screen.dart';
import 'package:switchit/screens/home/profile/followers/view/follow_main_screen.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view/list/items_for_trade_screen.dart';
import 'package:switchit/screens/home/profile/messages/view/list/messages_screen.dart';
import 'package:switchit/screens/home/profile/main/view_model/profile_view_model.dart';
import 'package:switchit/screens/login/view/login_screen.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    ProfileViewModel viewModel = context.watch<ProfileViewModel>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blueGrey),
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 100,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 150,
                      height: 30,
                      child: const Text("@example_user",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      width: 150,
                      height: 90,
                      child: const Text(
                        "Maecenas laoreet arcu tortor, sit amet faucibus nulla tempus eget."
                        "Suspendisse at erat in neque tincidunt malesuada."
                        "Quisque nisl arcu, eleifend at commodo non, sollicitudin non nisi. "
                        "Ut tempus, magna vel faucibus dapibus.",
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 60),
            Column(
              children: [
                Wrap(
                  runSpacing: 5,
                  children: [
                    GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const ItemsForTradeScreen(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "Items for Trade",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "My Favourites",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const MessagesScreen(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "Messages",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const FollowMainScreen(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "Followers/Following",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "Privacy Settings",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "Account Settings",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const CreditsScreen(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "Credits",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showAlertDialog(
                            context: context,
                            title: "Alert",
                            message:
                                "Are you sure you want to delete your account?",
                            cancelActionText: "No",
                            defaultActionText: "Yes",
                            onDefaultActionPressed: () {
                              _deleteAccount(context, viewModel);
                            });
                      },
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: const Text(
                          "Delete Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        showAlertDialog(
                            context: context,
                            title: "Alert",
                            message: "Are you sure you want to logout?",
                            cancelActionText: "No",
                            defaultActionText: "Yes",
                            onDefaultActionPressed: () {
                              _logout(context, viewModel);
                            });
                      },
                      child: Container(
                        height: 35,
                        width: 250,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: colorPrimary),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: const Text(
                          "Logout",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context, ProfileViewModel viewModel) async {
    final loading = ProgressHUD.of(context);

    await viewModel.logout();

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
          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
            context,
            settings: RouteSettings(name: LoginScreen.routeName),
            screen: const LoginScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        });
        break;
    }
  }

  Future<void> _deleteAccount(
      BuildContext context, ProfileViewModel viewModel) async {
    final loading = ProgressHUD.of(context);

    await viewModel.deleteAccount();

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
          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
            context,
            settings: RouteSettings(name: LoginScreen.routeName),
            screen: const LoginScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        });
        break;
    }
  }
}
