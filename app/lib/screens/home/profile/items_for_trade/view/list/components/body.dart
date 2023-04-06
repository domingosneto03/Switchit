import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/items_for_trade_view_model.dart';
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
    ItemsForTradeViewModel viewModel = context.watch<ItemsForTradeViewModel>();

    return FutureBuilder(
        future: viewModel.getItemsCurrentUser(),
        builder: (context, AsyncSnapshot<List<ItemDataModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];

                return Dismissible(
                  key: Key(item.name),
                  onDismissed: (direction) {
                    _deleteItem(context, viewModel, item.id);

                    setState(() {
                      snapshot.data!.removeAt(index);
                    });
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    title: Text(item.name),
                  ),
                );
              },
            );
          }
        });
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
