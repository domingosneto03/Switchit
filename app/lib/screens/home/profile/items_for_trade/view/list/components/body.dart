import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/items_for_trade_view_model.dart';
import 'package:switchit/util/status_view.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    ItemsForTradeViewModel viewModel = context.watch<ItemsForTradeViewModel>();
    viewModel.getItemsCurrentUser();

    final loading = ProgressHUD.of(context);

    return ListView.builder(
      itemCount: viewModel.items.length,
      itemBuilder: (context, index) {
        if (viewModel.status == StatusView.intial) {
          _getItems(context, viewModel);
        }
        if (viewModel.status == StatusView.inProgress) {
          loading?.show();
        } else if (viewModel.status == StatusView.done) {
          loading?.dismiss();

          final item = viewModel.items[index];
          return Dismissible(
            key: Key(item.name),
            onDismissed: (direction) {
              setState(() {
                viewModel.items.removeAt(index);
              });
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(item.name),
            ),
          );
        }
        return null;
      },
    );
  }

  Future<void> _getItems(
      BuildContext context, ItemsForTradeViewModel viewModel) async {
    await viewModel.getItemsCurrentUser();
  }
}
