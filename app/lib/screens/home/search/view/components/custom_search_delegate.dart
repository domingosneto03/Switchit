import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';

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