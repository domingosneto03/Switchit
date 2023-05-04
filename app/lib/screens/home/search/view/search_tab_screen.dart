import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/search/view/components/body.dart';
import 'package:switchit/models/items_to_trade_view_model.dart';

class SearchTabScreen extends StatelessWidget {
  const SearchTabScreen({super.key});

  static String routeName = "/search_tab_screen";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ItemsForTradeViewModel())
        ],
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Search'),
            ),
            body: const Body()));
  }
}
