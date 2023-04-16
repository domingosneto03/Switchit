import 'package:flutter/material.dart';
import 'package:switchit/screens/home/search/view/components/Item.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late CustomSearchDelegate _delegate;

  List<Item> itemList = [
    Item(
      name: "Red Dress",
      description: "A beautiful red dress for any occasion",
      price: 49.99,
      imageUrl: "https://example.com/red-dress.jpg",
    ),
    Item(
      name: "Black T-Shirt",
      description: "A comfortable black t-shirt for everyday wear",
      price: 19.99,
      imageUrl: "https://example.com/black-tshirt.jpg",
    ),
    Item(
      name: "Blue Jeans",
      description: "Classic blue jeans that never go out of style",
      price: 59.99,
      imageUrl: "https://example.com/blue-jeans.jpg",
    ),
    Item(
      name: "White Sneakers",
      description: "A pair of stylish and comfortable white sneakers",
      price: 79.99,
      imageUrl: "https://example.com/white-sneakers.jpg",
    ),
    Item(
      name: "Leather Jacket",
      description: "A sleek and stylish black leather jacket",
      price: 149.99,
      imageUrl: "https://example.com/leather-jacket.jpg",
    ),
    Item(
      name: "Running Shoes",
      description: "A pair of lightweight and breathable running shoes",
      price: 99.99,
      imageUrl: "https://example.com/running-shoes.jpg",
    ),
    Item(
      name: "Pink Blouse",
      description: "A feminine and elegant pink blouse",
      price: 39.99,
      imageUrl: "https://example.com/pink-blouse.jpg",
    ),
    Item(
      name: "Green Skirt",
      description: "A flowy and fun green skirt for summer",
      price: 29.99,
      imageUrl: "https://example.com/green-skirt.jpg",
    ),
    Item(
      name: "Winter Coat",
      description: "A warm and cozy coat for cold winter days",
      price: 129.99,
      imageUrl: "https://example.com/winter-coat.jpg",
    ),
    Item(
      name: "Striped Top",
      description: "A cute and casual striped top for everyday wear",
      price: 24.99,
      imageUrl: "https://example.com/striped-top.jpg",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _delegate = CustomSearchDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
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
              child:Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(itemList[index].name),
                    );
                  },
                ),
              ),
            )
          ],
        )
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  bool recentFlag = true;

  List<Item> itemList = [
    Item(
      name: "Red Dress",
      description: "A beautiful red dress for any occasion",
      price: 49.99,
      imageUrl: "https://example.com/red-dress.jpg",
    ),
    Item(
      name: "Black T-Shirt",
      description: "A comfortable black t-shirt for everyday wear",
      price: 19.99,
      imageUrl: "https://example.com/black-tshirt.jpg",
    ),
    Item(
      name: "Blue Jeans",
      description: "Classic blue jeans that never go out of style",
      price: 59.99,
      imageUrl: "https://example.com/blue-jeans.jpg",
    ),
    Item(
      name: "White Sneakers",
      description: "A pair of stylish and comfortable white sneakers",
      price: 79.99,
      imageUrl: "https://example.com/white-sneakers.jpg",
    ),
    Item(
      name: "Leather Jacket",
      description: "A sleek and stylish black leather jacket",
      price: 149.99,
      imageUrl: "https://example.com/leather-jacket.jpg",
    ),
    Item(
      name: "Running Shoes",
      description: "A pair of lightweight and breathable running shoes",
      price: 99.99,
      imageUrl: "https://example.com/running-shoes.jpg",
    ),
    Item(
      name: "Pink Blouse",
      description: "A feminine and elegant pink blouse",
      price: 39.99,
      imageUrl: "https://example.com/pink-blouse.jpg",
    ),
    Item(
      name: "Green Skirt",
      description: "A flowy and fun green skirt for summer",
      price: 29.99,
      imageUrl: "https://example.com/green-skirt.jpg",
    ),
    Item(
      name: "Winter Coat",
      description: "A warm and cozy coat for cold winter days",
      price: 129.99,
      imageUrl: "https://example.com/winter-coat.jpg",
    ),
    Item(
      name: "Striped Top",
      description: "A cute and casual striped top for everyday wear",
      price: 24.99,
      imageUrl: "https://example.com/striped-top.jpg",
    ),
  ];

  List<dynamic> recent = [];

  List<Item> suggestionsList=[];

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
            if (result is Item) {
              if (recent.contains(result)) {
                recent.remove(result);
              }
              recent.insert(0, result);
              recentFlag = false;
              showResults(context);
            }
          },
          child: ListTile(
            title: result is Item ? Text(result.name) : Text(result),
            leading: result is Item ? const Icon(Icons.image) : const Icon(Icons.search),
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