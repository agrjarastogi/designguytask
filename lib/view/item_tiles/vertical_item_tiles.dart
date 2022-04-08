import 'package:ecommerce/constants/text_types.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/item_model.dart';
import 'package:flutter/material.dart';

class VerticalItemTiles extends StatefulWidget {
  final ItemModel item;
  final String referrer;

  const VerticalItemTiles({Key? key, required this.item, this.referrer = ''})
      : super(key: key);

  @override
  _VerticalItemTiles createState() => _VerticalItemTiles();
}

class _VerticalItemTiles extends State<VerticalItemTiles>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int count = 0;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.redAccent;
    }
    return Colors.red;
  }

  @override
  void initState() {
    super.initState();
    count = CartModel.mapOfProductToQuantity[widget.item.id.toString()] ?? 0;
  }

  onIncrease() {
    CartModel.mapOfProductToQuantity[widget.item.id.toString()] = ++count;
    setState(() {
      count = count;
    });
  }

  onDecrease() {
    CartModel.mapOfProductToQuantity[widget.item.id.toString()] = --count;
    setState(() {
      count = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width / 1.2,
          height: 150,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: widget.referrer == 'orders'?const EdgeInsets.all(10.0):null,
                  decoration: BoxDecoration(
                    
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: widget.referrer == 'orders'?const EdgeInsets.all(0.0):EdgeInsets.all(10.0),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.network(
                          widget.item.image,
                          alignment: Alignment.center,
                          colorBlendMode: BlendMode.multiply,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(
                                widget.item.title,
                                style: heading.copyWith(fontSize: 20),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (widget.referrer == 'wishlist')
                              Flexible(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 27, 192, 129)
                                          .withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Text(
                                    widget.item.category,
                                    style: TextStyle(
                                        color: Colors.blue.shade900
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                          ],
                        ),
                        if (widget.referrer == 'wishlist')
                          Text(
                            '\$${widget.item.price}',
                            style: subheading.copyWith(fontSize: 15),
                          ),
                        if (widget.referrer == 'wishlist') addCartButton(),
                        if (widget.referrer == 'orders') getDetailRow()
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  addCartButton() {
    if (count == 0) {
      return GestureDetector(
        onTap: onIncrease,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red,
            ),
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
      );
    }
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        padding: const EdgeInsets.all(4.0),
        width: MediaQuery.of(context).size.width / 3.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: onIncrease,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 10,
                )),
            Text(
              ' $count ',
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
                onPressed: onDecrease,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 10,
                )),
          ],
        ));
  }

  getDetailRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: Text(
          '\$${widget.item.price}',
          style: subheading.copyWith(fontSize: 15),
        )),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: const Text(
              'Details',
              style: TextStyle(color: Colors.cyan),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 88, 56).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Text(
                //widget.item.status??'Delivered',
                "Delivered",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
