import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/search/view_model/items_to_trade_view_model.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchit/screens/home/search/view/components/custom_search_delegate.dart';
import 'package:switchit/screens/home/search/view_model/user_data_model.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late CustomSearchDelegate _delegate;
  late ItemsForTradeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _delegate = CustomSearchDelegate();
    viewModel = ItemsForTradeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.search),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black87,
              backgroundColor: Colors.white54,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(70))),
              alignment: Alignment.centerLeft,
              fixedSize: const Size(387,10),
            ),
            label: const Text('Search'),
            onPressed: () {
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: _delegate
              );
            },
          ),
            Expanded(
                flex: 1,
                child: RefreshIndicator(
                    onRefresh: () async {
                      await _getItems(context, viewModel);
                    },
                    child: (() {
                      if (viewModel.status == StatusView.inProgress) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (viewModel.items.isEmpty) {
                        return const Center(child: Text("You don't have items."));
                      } else {
                        return ListView.builder(
                            itemCount: viewModel.items.length,
                            itemBuilder: (context, index) {
                              final item = viewModel.items[index];
                              return Dismissible(
                                  key: Key(item.name),
                                  background: Container(color: Colors.red),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      const ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(item.name),
                                        subtitle: Text(item.description),
                                      ),
                                    ],
                                  ));
                            });
                      }
                    }()))),
          ],
        ),
    );
  }

  Future<void> _getItems(
      BuildContext context, ItemsForTradeViewModel viewModel) async {
    final loading = ProgressHUD.of(context);

    await viewModel.getAllItems();

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

        break;
    }
  }

  String getRandomItemImage(List<ItemDataModel> lista){
    Random random = Random();
    int randomNumber = random.nextInt(lista.length);
    return lista[randomNumber].imageUrl;
  }



}