import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view/new/components/body.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/items_for_trade_view_model.dart';

class ItemNewForTradeScreen extends StatelessWidget {
  const ItemNewForTradeScreen({super.key});

  static String routeName = "/item_new_for_trade_screen";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ItemsForTradeViewModel())
        ],
        child: Scaffold(
            appBar: AppBar(
              title: const Text('New item'),
            ),
            body: ProgressHUD(child: const Body())));
  }
}
