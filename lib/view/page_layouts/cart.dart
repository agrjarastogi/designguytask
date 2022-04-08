import 'package:ecommerce/api/cart_api.dart';
import 'package:flutter/material.dart';

import '../cart_tiles/vertical_cart_tiles.dart';

class Cart extends StatefulWidget{

  Cart({Key? key = const Key('Cart')}): super(key: key);
  @override
  _CartState createState() => _CartState();

}

class _CartState extends State<Cart>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: fetchAllCart(),
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
                  itemCount: cart.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: VerticalCartTile(item: cart.products[index]),
                    );
                  }),
            );
          },
        ));
  }
}
