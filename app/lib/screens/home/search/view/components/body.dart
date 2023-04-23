import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';
import 'package:switchit/screens/home/search/view_model/items_for_trade_view_model.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchit/screens/home/search/view/components/custom_search_delegate.dart';

import '../../view_model/user_data_model.dart';
import '../../view_model/user_view_model.dart';


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
        body: CustomScrollView(
          slivers:<Widget>[
            SliverToBoxAdapter(
              child:Container(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.search),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white54,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(70))),
                  alignment: Alignment.centerLeft,
                  fixedSize: const Size(410,10),
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
              ),
            ),
            Expanded(
                child: SliverGrid(
                  gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      pattern: [
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(2, 2),
                      ]
                  ),
                  delegate: SliverChildBuilderDelegate(
                      childCount: 10,
                          (context,index)=>Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('')
                                ),
                            )
                        ),
                      )
                  ),
                ),
          ],
        ),
    );
  }

  Future<void> _getItems(
      BuildContext context, ItemsForTradeViewModel viewModel) async {
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

  String getRandomItemImage(List<ItemDataModel> lista){
    Random random = Random();
    int randomNumber = random.nextInt(lista.length);
    return lista[randomNumber].imageUrl;
  }

}