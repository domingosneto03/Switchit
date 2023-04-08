import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view/new/item_new_for_trade_screen.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/items_for_trade_view_model.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ItemsForTradeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<ItemsForTradeViewModel>();

    return Column(children: <Widget>[
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
                            onDismissed: (direction) {
                              _deleteItem(context, viewModel, item.id);

                              setState(() {
                                viewModel.items.removeAt(index);
                              });
                            },
                            background: Container(color: Colors.red),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image.network(item.imageUrl,
                                      fit: BoxFit.cover, loadingBuilder:
                                          (context, child, loadingProgress) {
                                    if (loadingProgress != null) {
                                      return const CircularProgressIndicator();
                                    }
                                    return child;
                                  }),
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
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(40),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const ItemNewForTradeScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ).then((value) async {
                await viewModel.getItemsCurrentUser();
              });
            },
            child: const Text('New item'),
          ),
        ),
      ),
    ]);
  }

  Future<void> _getItems(
      BuildContext context, ItemsForTradeViewModel viewModel) async {
    final loading = ProgressHUD.of(context);

    await viewModel.getItemsCurrentUser();

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

  Future<void> _deleteItem(BuildContext context,
      ItemsForTradeViewModel viewModel, String itemId) async {
    final loading = ProgressHUD.of(context);

    await viewModel.deleteItem(itemId);

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
              message: "Item was deleted",
              cancelActionText: null,
              defaultActionText: "Ok",
              onDefaultActionPressed: () {});
        });
        break;
    }
  }
}
