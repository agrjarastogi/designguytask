import 'package:ecommerce/api/item_api.dart';
import 'package:ecommerce/view/item_tiles/vertical_item_tiles.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('WishList'),
          centerTitle: true,
        ),
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
            return Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: allProduct.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: VerticalItemTiles(item: allProduct[index], referrer: 'wishlist',),
                    );
                  }),
            );
          },
        ));
  }
}
