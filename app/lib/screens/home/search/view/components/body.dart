import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/search/view_model/items_to_trade_view_model.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  late ItemsForTradeViewModel viewModel;

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<ItemsForTradeViewModel>();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: editingController,
                onChanged: (value) {
                  viewModel.filterSearchResults(value);
                },
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {
                        editingController.clear();
                        viewModel.filterSearchResults("");
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              )),
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
                      return const Center(child: Text("No Results Found."));
                    } else {
                      return ListView.builder(
                          itemCount: viewModel.items.length,
                          itemBuilder: (context, index) {
                            final item = viewModel.items[index];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image.network(item.imageUrl,
                                      height: 250,
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
                            );
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
}
