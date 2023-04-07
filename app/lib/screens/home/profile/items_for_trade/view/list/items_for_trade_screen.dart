import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view/list/components/body.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/items_for_trade_view_model.dart';

class ItemsForTradeScreen extends StatefulWidget {
  const ItemsForTradeScreen({super.key});

  static String routeName = "/items_for_trade_screen";

  @override
  State<ItemsForTradeScreen> createState() => _ItemsForTradeScreenState();
}

class _ItemsForTradeScreenState extends State<ItemsForTradeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ItemsForTradeViewModel())
        ],
        child: Scaffold(
          appBar: AppBar(title: const Text('Items for trade')),
          body: ProgressHUD(child: const Body()),
        ));
  }
}
