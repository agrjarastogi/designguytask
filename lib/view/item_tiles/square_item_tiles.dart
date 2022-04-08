import 'package:ecommerce/constants/text_types.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/item_model.dart';
import 'package:flutter/material.dart';

import '../../constants/colorModel.dart';

class SquareItemTiles extends StatefulWidget {
  final ItemModel item;

  const SquareItemTiles({Key? key, required this.item}) : super(key: key);

  @override
  _SquareItemTiles createState() => _SquareItemTiles();
}

class _SquareItemTiles extends State<SquareItemTiles>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int count = 0;

  @override
  void initState() {
    super.initState();
    count = CartModel.mapOfProductToQuantity[widget.item.id.toString()] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: const [
            BoxShadow(
                blurRadius: 1,
                blurStyle: BlurStyle.outer,
                color: Colors.black54,
                offset: Offset(0, 0),
                spreadRadius: 2.0)
          ]),
        child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: SizedBox(
                height: 264,
                width: 200,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: colorSchemeLight.primary,
                        child: Stack(children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                          ),
                          Center(
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.network(widget.item.image,
                                  alignment: Alignment.center),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.item.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            Text('\$${widget.item.price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(
                              widget.item.description,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Category', style: subheading,),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 27, 192, 129).withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Text(
                                    widget.item.category,
                                    style: TextStyle(
                                        color: Colors.blue.shade900.withOpacity(0.6), fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              )),
    );
  }
}
