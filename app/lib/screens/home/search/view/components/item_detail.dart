import 'package:flutter/material.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/item_data_model.dart';
import 'package:switchit/screens/home/search/view/components/user_detail.dart';

class ItemDetail extends StatelessWidget{

  ItemDataModel item;

  ItemDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child: (() {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
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
                          ListTile(
                            title: Text(item.owner),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserDetail(email: item.owner)));
                            },
                          ),
                        ],
                      );
                    });
              }()))
        ],
      ),
    );
  }
}