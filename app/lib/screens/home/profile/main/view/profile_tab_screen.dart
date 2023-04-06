import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/profile/main/view/components/body.dart';
import 'package:switchit/screens/home/profile/main/view_model/profile_view_model.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  static String routeName = "/profile_tab_screen";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ProfileViewModel())],
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
            ),
            body: const Body()));
  }
}
