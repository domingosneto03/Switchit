import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:switchit/app/constants.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view/list/components/body.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view/new/item_new_for_trade_screen.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/items_for_trade_view_model.dart';

class ItemsForTradeScreen extends StatelessWidget {
  const ItemsForTradeScreen({super.key});

  static String routeName = "/items_for_trade_screen";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ItemsForTradeViewModel())
        ],
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Items for trade'),
            ),
            body: ProgressHUD(child: const Body()),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ItemNewForTradeScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              backgroundColor: colorPrimary,
              child: const Icon(Icons.add),
            )));
  }
}
