import 'package:flutter/material.dart';
import 'package:switchit/screens/home/search/view/components/body.dart';

class SearchTabScreen extends StatelessWidget {
  const SearchTabScreen({super.key});

  static String routeName = "/search_tab_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: const Body());
  }
}
