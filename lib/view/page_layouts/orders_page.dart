import 'package:ecommerce/api/item_api.dart';
import 'package:ecommerce/view/item_tiles/vertical_item_tiles.dart';
import 'package:flutter/material.dart';

import '../../model/item_model.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);
  
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Orders> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Orders'),
          centerTitle: true,
        ),
        backgroundColor: Color(0xfff6f6f6),
        body: FutureBuilder(
            future: fetchAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.active) {
                return const Center(
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator.adaptive(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.purple),
                        )));
              }
              List<ItemModel> items = snapshot.data as List<ItemModel>;
              return ListView(addAutomaticKeepAlives: true, children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 4, 0, 4),
                    child: TextField(
                      decoration: InputDecoration(
                          icon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                    ),
                  ),
                ),
                for (ItemModel item in items)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    child: VerticalItemTiles(item: item, referrer: 'orders',),
                  )
              ]);
            }));
  }
}
