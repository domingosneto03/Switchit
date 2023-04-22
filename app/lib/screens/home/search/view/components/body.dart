import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';
import 'package:switchit/screens/home/search/view_model/items_for_trade_view_model.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late CustomSearchDelegate _delegate;


  List<ItemDataModel> itemsList = [];

  @override
  void initState() {
    super.initState();
    _delegate = CustomSearchDelegate();

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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('https://picsum.photos/500/500?random=$index')
                            )
                        ),
                      )
                  ),
                ),
              ),
          ],
        ),
    );
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