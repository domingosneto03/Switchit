import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/screens/home/search/view_model/items_for_trade_view_model.dart';
import 'package:switchit/screens/home/search/view_model/user_data_model.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late CustomSearchDelegate _delegate;
  late ItemsForTradeViewModel viewModel;

  List<ItemDataModel> itemsList = [];

  @override
  void initState() {
    super.initState();
    _delegate = CustomSearchDelegate();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<ItemsForTradeViewModel>();

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
                      }
                      else {
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
                                  )
                              );
                            }
                            );
                        }
                      }())
                )
            ),
          ],
        )
    );
  }

  Future<void> _getItems(BuildContext context, ItemsForTradeViewModel viewModel) async {
    final loading = ProgressHUD.of(context);

    await viewModel.getItems();

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

class CustomSearchDelegate extends SearchDelegate {

  bool recentFlag = true;

  List<ItemDataModel> itemList = [];

  List<dynamic> recent = [];

  List<ItemDataModel> suggestionsList=[];

  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // show query result
  @override
  Widget buildResults(BuildContext context) {

    return ListView.builder(
      itemCount: suggestionsList.length,
      itemBuilder: (context, index) {
        var result = suggestionsList[index];
        return ListTile(
          title: Text(result.name),
        );
      },
    );
  }


  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    final recentList = query.isEmpty
        ? recent
        : itemList.where((p) => p.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: recentList.length,
      itemBuilder: (context, index) {
        dynamic result = recentList[index];
        return GestureDetector(
          onTap: () {
            if (result is ItemDataModel) {
              if (recent.contains(result)) {
                recent.remove(result);
              }
              recent.insert(0, result);
              recentFlag = false;
              showResults(context);
            }
          },
          child: ListTile(
            title: result is ItemDataModel ? Text(result.name) : Text(result),
            leading: result is ItemDataModel ? const Icon(Icons.image) : const Icon(Icons.search),
          ),
        );
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    if(query.isNotEmpty && recentFlag ) {
      if (recent.contains(query)) {
        recent.remove(query);
      }
      recent.insert(0, query);
    }
    recentFlag = true;
  }
}